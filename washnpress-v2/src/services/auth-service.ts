import { randomUUID } from "node:crypto";
import { addDaysIso } from "../domain/subscriptions";
import type { Resident, Session, User } from "../domain/models";
import type { DataStore, SessionRepository } from "../ports/repositories";
import type { OtpService } from "./otp-service";
import type { AppConfig } from "../config";

export class AuthService {
  constructor(private readonly store: DataStore, private readonly otp: OtpService, private readonly config: AppConfig, private readonly sessions: SessionRepository = store.sessions) {}

  sendOtp(phone: string) { return this.otp.send(phone); }

  async verifyOtp(phone: string, code: string): Promise<{ session: Session; user: User } | { error: string }> {
    const check = this.otp.verify(phone, code);
    if (!check.verified) return { error: check.reason ?? "Invalid OTP" };

    let user = (await this.store.users.find((u) => u.phone === phone))[0] ?? null;
    if (!user) {
      user = { id: randomUUID(), phone, fullName: null, status: "active", roles: ["resident"], lastLoginAt: null };
    }
    user.lastLoginAt = new Date().toISOString();
    await this.store.users.put(user);

    const resident = (await this.store.residents.find((r) => r.userId === user!.id))[0] ?? null;
    const session: Session = {
      token: randomUUID(), userId: user.id, roles: user.roles,
      residentId: resident?.id ?? null, societyId: resident?.societyId ?? null,
      expiresAt: addDaysIso(new Date().toISOString(), this.config.auth.sessionTtlSeconds / 86400),
    };
    await this.sessions.create(session);
    return { session, user };
  }

  async completeOnboarding(
  session: Session,
  input: {
    fullName: string;
    societyId: string;
    unitNumber: string;
    towerBlock?: string;
    preferredWindows?: string[];
  }
): Promise<Resident> {
  const user = await this.store.users.get(session.userId);
  if (!user) throw new Error("User not found");

  user.fullName = input.fullName;
  await this.store.users.put(user);

  const existing = (
    await this.store.residents.find((r) => r.userId === session.userId)
  )[0] ?? null;

  const resident: Resident = existing
    ? {
        ...existing,
        societyId: input.societyId,
        unitNumber: input.unitNumber,
        towerBlock: input.towerBlock ?? null,
        preferredWindows: input.preferredWindows ?? [],
      }
    : {
        id: randomUUID(),
        userId: session.userId,
        societyId: input.societyId,
        unitNumber: input.unitNumber,
        towerBlock: input.towerBlock ?? null,
        preferredWindows: input.preferredWindows ?? [],
      };

  await this.store.residents.put(resident);

  // Update the current session
  session.residentId = resident.id;
  session.societyId = resident.societyId;

  await this.sessions.create(session);

  return resident;
}

  async sessionFromToken(token: string | undefined): Promise<Session | null> {
    if (!token) return null;
    const session = await this.sessions.findByToken(token);
    if (!session) return null;
    if (new Date(session.expiresAt).getTime() < Date.now()) { await this.sessions.delete(token); return null; }
    return session;
  }

  async logout(token: string): Promise<void> { await this.sessions.delete(token); }
}
