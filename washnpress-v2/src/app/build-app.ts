import Fastify, { type FastifyInstance } from "fastify";
import cors from "@fastify/cors";
import { metrics } from "../observability/metrics";
import type { Container } from "../container";
import { registerHealthRoutes } from "./routes/health";
import { registerAuthRoutes } from "./routes/auth";
import { registerCatalogRoutes } from "./routes/catalog";
import { registerSubscriptionRoutes } from "./routes/subscription";
import { registerPickupRoutes } from "./routes/pickups";
import { registerOrderRoutes } from "./routes/orders";
import { registerOperationsRoutes } from "./routes/operations";
import { registerWalletRoutes } from "./routes/wallet";
import { registerPaymentRoutes } from "./routes/payments";
import { registerSupportRoutes } from "./routes/support";
import { registerSustainabilityRoutes } from "./routes/sustainability";
import { registerAdminRoutes } from "./routes/admin";
import { readFileSync } from "fs";
import { join } from "path";
import swagger from "@fastify/swagger";
import swaggerUi from "@fastify/swagger-ui";
export function buildApp(container: Container): FastifyInstance {
  const app = Fastify({ logger: { level: container.config.app.logLevel } });

  const openapiPath = join(process.cwd(), "docs", "openapi.json");
  const openapiDocument = JSON.parse(readFileSync(openapiPath, "utf-8"));

  app.register(swagger, {
    mode: "static",
    specification: {
      document: openapiDocument
    }
  });

  app.register(swaggerUi, {
    routePrefix: "/docs"
  });

  app.register(cors, {
    origin: (origin, cb) => {
      const allowedOrigins = container.config.app.frontendUrl.split(",").map((url) => url.trim());
      if (!origin || allowedOrigins.includes(origin)) {
        cb(null, true);
        return;
      }
      cb(new Error("Not allowed by CORS"), false);
    },
    methods: ["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type", "Authorization", "Accept"],
    credentials: true,
  });

  // Capture the raw JSON body so payment webhook signatures verify over exact bytes.
  app.addContentTypeParser("application/json", { parseAs: "string" }, (_req, body, done) => {
    const raw = body as string;
    (_req as unknown as { rawBody: string }).rawBody = raw;
    try { done(null, raw.length ? JSON.parse(raw) : {}); }
    catch (error) { done(error as Error, undefined); }
  });

  // Optional API rate limiting, shared across instances when Redis is configured.
  if (container.config.rateLimit.apiEnabled) {
    app.addHook("onRequest", async (request, reply) => {
      const path = request.url.split("?")[0];
      if (path === "/health" || path === "/metrics") return;
      const ip = request.ip || "unknown";
      const r = await container.rateLimit.hit(`api:${ip}`, container.config.rateLimit.api.limit, container.config.rateLimit.api.windowSeconds * 1000);
      if (!r.allowed) {
        reply.header("retry-after", String(r.resetSeconds));
        reply.code(429).send({ error: "rate_limited", retryAfterSeconds: r.resetSeconds });
      }
    });
  }

  // Count every response for the metrics endpoint.
  app.addHook("onResponse", async (request, reply) => {
    const route = (request.routeOptions && request.routeOptions.url) || request.url.split("?")[0];
    metrics.inc("http_requests_total", { method: request.method, route, status: String(reply.statusCode) });
  });

  // Prometheus scrape endpoint.
  if (container.config.observability.metricsEnabled) {
    app.get("/metrics", async (_request, reply) => {
      reply.header("content-type", "text/plain; version=0.0.4");
      return metrics.render();
    });
  }

  registerHealthRoutes(app, container);
  registerAuthRoutes(app, container);
  registerCatalogRoutes(app, container);
  registerSubscriptionRoutes(app, container);
  registerPickupRoutes(app, container);
  registerOrderRoutes(app, container);
  registerOperationsRoutes(app, container);
  registerWalletRoutes(app, container);
  registerPaymentRoutes(app, container);
  registerSupportRoutes(app, container);
  registerSustainabilityRoutes(app, container);
  registerAdminRoutes(app, container);

  return app;
}
