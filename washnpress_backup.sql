--
-- PostgreSQL database dump
--

\restrict zzCRCuc667XetDUkIogJyU3TGJi52r0GdG8hc6YcBTrVCmlyUCYgJuGoNeURKJL

-- Dumped from database version 16.14
-- Dumped by pg_dump version 18.3 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addons; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.addons (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.addons OWNER TO washnpress;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.audit_logs (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.audit_logs OWNER TO washnpress;

--
-- Name: ledger_entry; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.ledger_entry (
    txn_id text NOT NULL,
    idx integer NOT NULL,
    account text NOT NULL,
    direction text NOT NULL,
    amount bigint NOT NULL
);


ALTER TABLE public.ledger_entry OWNER TO washnpress;

--
-- Name: ledger_txn; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.ledger_txn (
    id text NOT NULL,
    reference text NOT NULL,
    created_at text NOT NULL
);


ALTER TABLE public.ledger_txn OWNER TO washnpress;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.orders (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.orders OWNER TO washnpress;

--
-- Name: outbox_events; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.outbox_events (
    id text NOT NULL,
    doc jsonb NOT NULL,
    status text NOT NULL
);


ALTER TABLE public.outbox_events OWNER TO washnpress;

--
-- Name: payment_intents; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.payment_intents (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.payment_intents OWNER TO washnpress;

--
-- Name: pickups; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.pickups (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.pickups OWNER TO washnpress;

--
-- Name: plans; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.plans (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.plans OWNER TO washnpress;

--
-- Name: processed_events; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.processed_events (
    event_id text NOT NULL
);


ALTER TABLE public.processed_events OWNER TO washnpress;

--
-- Name: residents; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.residents (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.residents OWNER TO washnpress;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.sessions (
    token text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.sessions OWNER TO washnpress;

--
-- Name: slots; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.slots (
    id text NOT NULL,
    doc jsonb NOT NULL,
    capacity_remaining integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.slots OWNER TO washnpress;

--
-- Name: societies; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.societies (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.societies OWNER TO washnpress;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.subscriptions (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO washnpress;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.tickets (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.tickets OWNER TO washnpress;

--
-- Name: units; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.units (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.units OWNER TO washnpress;

--
-- Name: users; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.users (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.users OWNER TO washnpress;

--
-- Name: water_logs; Type: TABLE; Schema: public; Owner: washnpress
--

CREATE TABLE public.water_logs (
    id text NOT NULL,
    doc jsonb NOT NULL
);


ALTER TABLE public.water_logs OWNER TO washnpress;

--
-- Data for Name: addons; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.addons (id, doc) FROM stdin;
addon-dryclean	{"id": "addon-dryclean", "name": "Dry cleaning", "isActive": true, "pricePaise": 15000}
addon-express	{"id": "addon-express", "name": "Express delivery", "isActive": true, "pricePaise": 9900}
addon-shoe	{"id": "addon-shoe", "name": "Shoe and bag cleaning", "isActive": true, "pricePaise": 19900}
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.audit_logs (id, doc) FROM stdin;
\.


--
-- Data for Name: ledger_entry; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.ledger_entry (txn_id, idx, account, direction, amount) FROM stdin;
e890c0bf-958c-4662-8590-f76f24ca3e15	0	gateway_clearing	debit	20000
e890c0bf-958c-4662-8590-f76f24ca3e15	1	resident_wallet:res-demo	credit	20000
e3539b30-4289-49f3-b82a-f46c996ed760	0	gateway_clearing	debit	50000
e3539b30-4289-49f3-b82a-f46c996ed760	1	resident_wallet:res-demo	credit	50000
4ffb9593-998a-4bb5-8b70-93303284baed	0	resident_wallet:res-demo	debit	49900
4ffb9593-998a-4bb5-8b70-93303284baed	1	subscription_revenue	credit	49900
f72472d0-04c6-4352-817e-edb090797c6b	0	gateway_clearing	debit	20000
f72472d0-04c6-4352-817e-edb090797c6b	1	resident_wallet:res-demo	credit	20000
40dbfada-0bd3-4308-aec5-a1ec0b005c86	0	gateway_clearing	debit	20000
40dbfada-0bd3-4308-aec5-a1ec0b005c86	1	resident_wallet:res-demo	credit	20000
cbf54502-8a89-4411-bfa7-26a525095433	0	gateway_clearing	debit	20000
cbf54502-8a89-4411-bfa7-26a525095433	1	resident_wallet:res-demo	credit	20000
8403875e-b33d-4bb6-ad7d-1515ffebc484	0	gateway_clearing	debit	20000
8403875e-b33d-4bb6-ad7d-1515ffebc484	1	resident_wallet:res-demo	credit	20000
e8b5d96e-2dc1-439c-a82d-73b54d7cb2c7	0	gateway_clearing	debit	50000
e8b5d96e-2dc1-439c-a82d-73b54d7cb2c7	1	resident_wallet:res-demo	credit	50000
bdc6c5c7-e147-403b-a1ac-ab88e6741c94	0	gateway_clearing	debit	50000
bdc6c5c7-e147-403b-a1ac-ab88e6741c94	1	resident_wallet:res-demo	credit	50000
28a9cc75-ada6-466e-a3ec-cdf8ebd5fc89	0	gateway_clearing	debit	50000
28a9cc75-ada6-466e-a3ec-cdf8ebd5fc89	1	resident_wallet:res-demo	credit	50000
0e1cf395-9719-45e6-9613-b42949d1a0ce	0	gateway_clearing	debit	100000
0e1cf395-9719-45e6-9613-b42949d1a0ce	1	resident_wallet:res-demo	credit	100000
5153b978-9024-40aa-98d2-5eb565a80406	0	gateway_clearing	debit	100000
5153b978-9024-40aa-98d2-5eb565a80406	1	resident_wallet:res-demo	credit	100000
1c26e78b-aa3c-4223-a65d-a3284f236ba4	0	gateway_clearing	debit	100000
1c26e78b-aa3c-4223-a65d-a3284f236ba4	1	resident_wallet:res-demo	credit	100000
f6246a28-bb73-438b-9052-dc5699669469	0	gateway_clearing	debit	100000
f6246a28-bb73-438b-9052-dc5699669469	1	resident_wallet:res-demo	credit	100000
2edceff7-9882-465f-a975-7a593cdeba4c	0	gateway_clearing	debit	100000
2edceff7-9882-465f-a975-7a593cdeba4c	1	resident_wallet:res-demo	credit	100000
b4889012-315e-4db5-bf2c-ffe0950c24c8	0	gateway_clearing	debit	50000
b4889012-315e-4db5-bf2c-ffe0950c24c8	1	resident_wallet:res-demo	credit	50000
4da73874-2ea5-4aec-86c9-e2d9a66199ab	0	gateway_clearing	debit	100000
4da73874-2ea5-4aec-86c9-e2d9a66199ab	1	resident_wallet:res-demo	credit	100000
68cf2dd4-b05f-4845-a716-ca0658b02816	0	gateway_clearing	debit	50000
68cf2dd4-b05f-4845-a716-ca0658b02816	1	resident_wallet:res-demo	credit	50000
3fabe46b-c45f-47cf-a2bf-07fa9f437a11	0	gateway_clearing	debit	20000
3fabe46b-c45f-47cf-a2bf-07fa9f437a11	1	resident_wallet:res-demo	credit	20000
\.


--
-- Data for Name: ledger_txn; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.ledger_txn (id, reference, created_at) FROM stdin;
e890c0bf-958c-4662-8590-f76f24ca3e15	order_fake_2d4bbd39-2bf	2026-08-10T13:28:56.149Z
e3539b30-4289-49f3-b82a-f46c996ed760	order_fake_1e0ff898-134	2026-08-10T13:28:56.160Z
4ffb9593-998a-4bb5-8b70-93303284baed	sub-res-demo-1786368542537	2026-08-10T13:29:02.539Z
f72472d0-04c6-4352-817e-edb090797c6b	order_fake_1159b3bf-041	2026-08-10T13:29:56.159Z
40dbfada-0bd3-4308-aec5-a1ec0b005c86	order_fake_54707b20-a32	2026-08-10T13:29:56.168Z
cbf54502-8a89-4411-bfa7-26a525095433	order_fake_02554376-f78	2026-08-10T13:29:56.172Z
8403875e-b33d-4bb6-ad7d-1515ffebc484	order_fake_588b73d5-fce	2026-08-10T13:29:56.175Z
e8b5d96e-2dc1-439c-a82d-73b54d7cb2c7	order_fake_597c1654-aca	2026-08-10T13:29:56.178Z
bdc6c5c7-e147-403b-a1ac-ab88e6741c94	order_fake_750cbb84-a37	2026-08-10T13:29:56.182Z
28a9cc75-ada6-466e-a3ec-cdf8ebd5fc89	order_fake_9adc64b1-3c8	2026-08-10T13:29:56.185Z
0e1cf395-9719-45e6-9613-b42949d1a0ce	order_fake_311b194d-c49	2026-08-10T13:29:56.189Z
5153b978-9024-40aa-98d2-5eb565a80406	order_fake_63044c98-689	2026-08-10T13:29:56.193Z
1c26e78b-aa3c-4223-a65d-a3284f236ba4	order_fake_edd5f38f-c50	2026-08-10T13:29:56.199Z
f6246a28-bb73-438b-9052-dc5699669469	order_fake_3071df1b-450	2026-08-10T13:29:56.201Z
2edceff7-9882-465f-a975-7a593cdeba4c	order_fake_e013e564-34a	2026-08-10T13:29:56.204Z
b4889012-315e-4db5-bf2c-ffe0950c24c8	order_fake_b83312c6-0b8	2026-08-11T06:58:32.593Z
4da73874-2ea5-4aec-86c9-e2d9a66199ab	order_fake_7ba4b315-b65	2026-08-11T06:58:32.606Z
68cf2dd4-b05f-4845-a716-ca0658b02816	order_fake_1b237cc7-b09	2026-08-11T06:58:32.612Z
3fabe46b-c45f-47cf-a2bf-07fa9f437a11	order_fake_c94f1b74-c2f	2026-08-11T06:58:32.618Z
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.orders (id, doc) FROM stdin;
067510f6-36ce-497b-82a9-abb302422b6d	{"id": "067510f6-36ce-497b-82a9-abb302422b6d", "items": [], "state": "scheduled", "rating": null, "addonIds": [], "pickupId": "98a11382-feb2-4444-b918-d646df1028f8", "qcPassed": null, "qcReason": null, "timeline": [{"at": "2026-08-11T06:57:58.450Z", "state": "scheduled"}], "createdAt": "2026-08-11T06:57:58.450Z", "orderCode": "ORD-688562", "societyId": "soc-demo", "residentId": "res-demo", "pickupCount": null, "qrBatchCode": null, "deliveryCount": null, "ratingComment": null, "subscriptionId": null, "discrepancyReason": null}
053215dd-9349-46ef-8bb2-21752893bad4	{"id": "053215dd-9349-46ef-8bb2-21752893bad4", "items": [{"category": "Shirts", "quantity": 1}, {"category": "Trousers", "quantity": 1}, {"category": "Bedsheets", "quantity": 1}, {"category": "Other", "quantity": 1}], "state": "picked_up", "rating": null, "addonIds": [], "pickupId": "a0470c0a-f530-45e3-abe4-7acd62859634", "qcPassed": null, "qcReason": null, "timeline": [{"at": "2026-08-10T13:28:51.328Z", "state": "scheduled"}, {"at": "2026-08-12T07:20:26.798Z", "note": "QR WNP-CZ6SX5M2", "state": "picked_up"}], "createdAt": "2026-08-10T13:28:51.328Z", "orderCode": "ORD-498301", "societyId": "soc-demo", "residentId": "res-demo", "pickupCount": 4, "qrBatchCode": "WNP-CZ6SX5M2", "deliveryCount": null, "ratingComment": null, "subscriptionId": null, "discrepancyReason": null}
53fc1bd6-62bc-4ed5-a2b9-b63f45bfefa9	{"id": "53fc1bd6-62bc-4ed5-a2b9-b63f45bfefa9", "items": [{"category": "Shirts", "quantity": 3}, {"category": "Trousers", "quantity": 2}, {"category": "Bedsheets", "quantity": 2}, {"category": "Other", "quantity": 2}], "state": "delivered", "rating": null, "addonIds": [], "pickupId": "c010d121-5c77-42ec-84db-bd2c019d6162", "qcPassed": true, "qcReason": null, "timeline": [{"at": "2026-08-10T13:28:54.221Z", "state": "scheduled"}, {"at": "2026-08-12T07:25:05.715Z", "note": "QR WNP-57SSBJCS", "state": "picked_up"}, {"at": "2026-08-12T07:25:08.896Z", "state": "in_wash"}, {"at": "2026-08-12T07:25:10.340Z", "state": "ironing"}, {"at": "2026-08-12T07:25:11.477Z", "state": "qc"}, {"at": "2026-08-12T07:25:17.397Z", "state": "ready_for_delivery"}, {"at": "2026-08-12T07:25:18.616Z", "state": "out_for_delivery"}, {"at": "2026-08-12T07:25:26.528Z", "state": "delivered"}], "createdAt": "2026-08-10T13:28:54.221Z", "orderCode": "ORD-939216", "societyId": "soc-demo", "residentId": "res-demo", "pickupCount": 9, "qrBatchCode": "WNP-57SSBJCS", "deliveryCount": 9, "ratingComment": null, "subscriptionId": null, "discrepancyReason": null}
6f803e7a-1520-430f-941b-b01c1ac31435	{"id": "6f803e7a-1520-430f-941b-b01c1ac31435", "items": [{"category": "Shirts", "quantity": 3}], "state": "out_for_delivery", "rating": null, "addonIds": [], "pickupId": "734dea9d-e27b-470c-997a-c06471b71257", "qcPassed": true, "qcReason": null, "timeline": [{"at": "2026-08-10T13:28:39.964Z", "state": "scheduled"}, {"at": "2026-08-12T07:20:10.158Z", "note": "QR WNP-X53M9TF9", "state": "picked_up"}, {"at": "2026-08-12T07:20:11.615Z", "state": "in_wash"}, {"at": "2026-08-12T07:20:12.360Z", "state": "ironing"}, {"at": "2026-08-12T07:20:12.628Z", "state": "qc"}, {"at": "2026-08-12T07:20:12.828Z", "state": "ready_for_delivery"}, {"at": "2026-08-12T07:20:13.534Z", "state": "out_for_delivery"}], "createdAt": "2026-08-10T13:28:39.964Z", "orderCode": "ORD-576459", "societyId": "soc-demo", "residentId": "res-demo", "pickupCount": 3, "qrBatchCode": "WNP-X53M9TF9", "deliveryCount": null, "ratingComment": null, "subscriptionId": null, "discrepancyReason": null}
\.


--
-- Data for Name: outbox_events; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.outbox_events (id, doc, status) FROM stdin;
a75ad189-6fd7-4c0d-8e90-0771653c12ff	{"id": "a75ad189-6fd7-4c0d-8e90-0771653c12ff", "type": "pickup.booked", "status": "sent", "payload": {"to": "res-demo", "body": "Your pickup is confirmed. Order ORD-576459.", "title": "Pickup booked"}, "attempts": 1, "createdAt": "2026-08-10T13:28:39.966Z"}	sent
f2f20d55-e8b0-4233-81c7-0550f2115475	{"id": "f2f20d55-e8b0-4233-81c7-0550f2115475", "type": "pickup.booked", "status": "sent", "payload": {"to": "res-demo", "body": "Your pickup is confirmed. Order ORD-498301.", "title": "Pickup booked"}, "attempts": 1, "createdAt": "2026-08-10T13:28:51.330Z"}	sent
d2ae0406-32de-46cc-b989-1f7ae4214c6c	{"id": "d2ae0406-32de-46cc-b989-1f7ae4214c6c", "type": "pickup.booked", "status": "sent", "payload": {"to": "res-demo", "body": "Your pickup is confirmed. Order ORD-939216.", "title": "Pickup booked"}, "attempts": 1, "createdAt": "2026-08-10T13:28:54.222Z"}	sent
1a86ac00-fb71-45a5-a534-265a1e69ba05	{"id": "1a86ac00-fb71-45a5-a534-265a1e69ba05", "type": "pickup.booked", "status": "sent", "payload": {"to": "res-demo", "body": "Your pickup is confirmed. Order ORD-688562.", "title": "Pickup booked"}, "attempts": 1, "createdAt": "2026-08-11T06:57:58.453Z"}	sent
cc88343f-99a2-4ae5-8c4a-7d1302a0f677	{"id": "cc88343f-99a2-4ae5-8c4a-7d1302a0f677", "type": "pickup.completed", "status": "sent", "payload": {"to": "res-demo", "body": "3 garments collected for order ORD-576459.", "title": "Garments collected"}, "attempts": 1, "createdAt": "2026-08-12T07:20:10.165Z"}	sent
c4fe9056-564c-4be4-916f-d04c9e752c6d	{"id": "c4fe9056-564c-4be4-916f-d04c9e752c6d", "type": "order.out_for_delivery", "status": "sent", "payload": {"to": "res-demo", "body": "Order ORD-576459 is out for delivery.", "title": "On the way"}, "attempts": 1, "createdAt": "2026-08-12T07:20:13.536Z"}	sent
b8fa4a9a-93f5-46e4-9a93-6995c0c701c9	{"id": "b8fa4a9a-93f5-46e4-9a93-6995c0c701c9", "type": "pickup.completed", "status": "sent", "payload": {"to": "res-demo", "body": "4 garments collected for order ORD-498301.", "title": "Garments collected"}, "attempts": 1, "createdAt": "2026-08-12T07:20:26.802Z"}	sent
dad1dfa0-26f7-464c-914e-dbae49e93ac6	{"id": "dad1dfa0-26f7-464c-914e-dbae49e93ac6", "type": "pickup.completed", "status": "sent", "payload": {"to": "res-demo", "body": "9 garments collected for order ORD-939216.", "title": "Garments collected"}, "attempts": 1, "createdAt": "2026-08-12T07:25:05.723Z"}	sent
9dafbd6a-de6b-4480-a354-fde4317d3c91	{"id": "9dafbd6a-de6b-4480-a354-fde4317d3c91", "type": "order.out_for_delivery", "status": "sent", "payload": {"to": "res-demo", "body": "Order ORD-939216 is out for delivery.", "title": "On the way"}, "attempts": 1, "createdAt": "2026-08-12T07:25:18.618Z"}	sent
2cedf324-83fc-4017-8cd7-19bbb973b79e	{"id": "2cedf324-83fc-4017-8cd7-19bbb973b79e", "type": "order.delivered", "status": "sent", "payload": {"to": "res-demo", "body": "Order ORD-939216 delivered.", "title": "Delivered"}, "attempts": 1, "createdAt": "2026-08-12T07:25:26.529Z"}	sent
\.


--
-- Data for Name: payment_intents; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.payment_intents (id, doc) FROM stdin;
42c12bee-692c-4760-82ee-254e5c14c386	{"id": "42c12bee-692c-4760-82ee-254e5c14c386", "status": "reconciled", "createdAt": "2026-08-10T13:28:28.383Z", "residentId": "res-demo", "amountPaise": 20000, "providerOrderId": "order_fake_2d4bbd39-2bf"}
50d87a2d-9736-4b81-928b-bef399792c12	{"id": "50d87a2d-9736-4b81-928b-bef399792c12", "status": "reconciled", "createdAt": "2026-08-10T13:28:29.253Z", "residentId": "res-demo", "amountPaise": 50000, "providerOrderId": "order_fake_1e0ff898-134"}
ebe9e9c8-4fe9-4187-a1d5-9b6fa7ae2992	{"id": "ebe9e9c8-4fe9-4187-a1d5-9b6fa7ae2992", "status": "reconciled", "createdAt": "2026-08-10T13:29:14.999Z", "residentId": "res-demo", "amountPaise": 20000, "providerOrderId": "order_fake_1159b3bf-041"}
ba030da8-be66-45b4-8a4d-f9bad0cf9964	{"id": "ba030da8-be66-45b4-8a4d-f9bad0cf9964", "status": "reconciled", "createdAt": "2026-08-10T13:29:15.715Z", "residentId": "res-demo", "amountPaise": 20000, "providerOrderId": "order_fake_54707b20-a32"}
dbf0b010-5cc7-4037-aec0-0267abf052ef	{"id": "dbf0b010-5cc7-4037-aec0-0267abf052ef", "status": "reconciled", "createdAt": "2026-08-10T13:29:15.933Z", "residentId": "res-demo", "amountPaise": 20000, "providerOrderId": "order_fake_02554376-f78"}
6a347d9f-4221-413e-961f-ea01ff50c4b4	{"id": "6a347d9f-4221-413e-961f-ea01ff50c4b4", "status": "reconciled", "createdAt": "2026-08-10T13:29:16.149Z", "residentId": "res-demo", "amountPaise": 20000, "providerOrderId": "order_fake_588b73d5-fce"}
3cf9dcf4-3ec5-466a-82ea-d7d0a627920a	{"id": "3cf9dcf4-3ec5-466a-82ea-d7d0a627920a", "status": "reconciled", "createdAt": "2026-08-10T13:29:16.716Z", "residentId": "res-demo", "amountPaise": 50000, "providerOrderId": "order_fake_597c1654-aca"}
b5c37902-35f8-4f14-9e04-13557a2621cd	{"id": "b5c37902-35f8-4f14-9e04-13557a2621cd", "status": "reconciled", "createdAt": "2026-08-10T13:29:16.983Z", "residentId": "res-demo", "amountPaise": 50000, "providerOrderId": "order_fake_750cbb84-a37"}
8178f6d3-cc3c-42f7-866a-1a5bcee04997	{"id": "8178f6d3-cc3c-42f7-866a-1a5bcee04997", "status": "reconciled", "createdAt": "2026-08-10T13:29:17.183Z", "residentId": "res-demo", "amountPaise": 50000, "providerOrderId": "order_fake_9adc64b1-3c8"}
d085edc6-ce8f-4195-9315-594febe1e9d6	{"id": "d085edc6-ce8f-4195-9315-594febe1e9d6", "status": "reconciled", "createdAt": "2026-08-10T13:29:17.699Z", "residentId": "res-demo", "amountPaise": 100000, "providerOrderId": "order_fake_311b194d-c49"}
f0a3aa64-d186-487b-92db-3c331091577b	{"id": "f0a3aa64-d186-487b-92db-3c331091577b", "status": "reconciled", "createdAt": "2026-08-10T13:29:18.116Z", "residentId": "res-demo", "amountPaise": 100000, "providerOrderId": "order_fake_63044c98-689"}
7b284c96-9617-4579-9ec0-33487540dfc0	{"id": "7b284c96-9617-4579-9ec0-33487540dfc0", "status": "reconciled", "createdAt": "2026-08-10T13:29:18.350Z", "residentId": "res-demo", "amountPaise": 100000, "providerOrderId": "order_fake_edd5f38f-c50"}
8fd74c50-6a19-4898-8abc-d91897207918	{"id": "8fd74c50-6a19-4898-8abc-d91897207918", "status": "reconciled", "createdAt": "2026-08-10T13:29:18.549Z", "residentId": "res-demo", "amountPaise": 100000, "providerOrderId": "order_fake_3071df1b-450"}
98ac822a-a31f-40f8-b341-89727b8d119c	{"id": "98ac822a-a31f-40f8-b341-89727b8d119c", "status": "reconciled", "createdAt": "2026-08-10T13:29:20.310Z", "residentId": "res-demo", "amountPaise": 100000, "providerOrderId": "order_fake_e013e564-34a"}
f24276b5-5dc3-4f55-94c6-552b859a52a3	{"id": "f24276b5-5dc3-4f55-94c6-552b859a52a3", "status": "reconciled", "createdAt": "2026-08-11T06:58:09.813Z", "residentId": "res-demo", "amountPaise": 50000, "providerOrderId": "order_fake_b83312c6-0b8"}
5931f2da-108c-4174-b480-acb9e5dad8d0	{"id": "5931f2da-108c-4174-b480-acb9e5dad8d0", "status": "reconciled", "createdAt": "2026-08-11T06:58:10.522Z", "residentId": "res-demo", "amountPaise": 100000, "providerOrderId": "order_fake_7ba4b315-b65"}
8310a425-d8d7-49df-87df-f0047fbd78a0	{"id": "8310a425-d8d7-49df-87df-f0047fbd78a0", "status": "reconciled", "createdAt": "2026-08-11T06:58:10.982Z", "residentId": "res-demo", "amountPaise": 50000, "providerOrderId": "order_fake_1b237cc7-b09"}
0fee11e2-579c-40bb-a786-8497efa8bc4c	{"id": "0fee11e2-579c-40bb-a786-8497efa8bc4c", "status": "reconciled", "createdAt": "2026-08-11T06:58:11.415Z", "residentId": "res-demo", "amountPaise": 20000, "providerOrderId": "order_fake_c94f1b74-c2f"}
\.


--
-- Data for Name: pickups; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.pickups (id, doc) FROM stdin;
98a11382-feb2-4444-b918-d646df1028f8	{"id": "98a11382-feb2-4444-b918-d646df1028f8", "slotId": "572f28b2-f00d-4f34-9145-9c5ae512d5c7", "status": "scheduled", "recurring": false, "societyId": "soc-demo", "residentId": "res-demo", "scheduledFor": "2026-08-11T08:00:00.000Z", "recurringDays": [], "specialInstructions": null}
734dea9d-e27b-470c-997a-c06471b71257	{"id": "734dea9d-e27b-470c-997a-c06471b71257", "slotId": "72eb90ba-21d3-4147-9e08-e205373980bc", "status": "completed", "recurring": false, "societyId": "soc-demo", "residentId": "res-demo", "scheduledFor": "2026-08-10T08:00:00.000Z", "recurringDays": [], "specialInstructions": null}
a0470c0a-f530-45e3-abe4-7acd62859634	{"id": "a0470c0a-f530-45e3-abe4-7acd62859634", "slotId": "1be5172e-f1cb-423a-b6a3-01313b18d91e", "status": "completed", "recurring": false, "societyId": "soc-demo", "residentId": "res-demo", "scheduledFor": "2026-08-10T13:00:00.000Z", "recurringDays": [], "specialInstructions": null}
c010d121-5c77-42ec-84db-bd2c019d6162	{"id": "c010d121-5c77-42ec-84db-bd2c019d6162", "slotId": "72eb90ba-21d3-4147-9e08-e205373980bc", "status": "completed", "recurring": false, "societyId": "soc-demo", "residentId": "res-demo", "scheduledFor": "2026-08-10T08:00:00.000Z", "recurringDays": [], "specialInstructions": null}
\.


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.plans (id, doc) FROM stdin;
plan-basic	{"id": "plan-basic", "tier": "Basic", "isActive": true, "garmentCap": 40, "monthlyPaise": 49900, "turnaroundHours": 48, "annualDiscountPercent": 15}
plan-standard	{"id": "plan-standard", "tier": "Standard", "isActive": true, "garmentCap": 80, "monthlyPaise": 89900, "turnaroundHours": 36, "annualDiscountPercent": 15}
plan-premium	{"id": "plan-premium", "tier": "Premium", "isActive": true, "garmentCap": 120, "monthlyPaise": 129900, "turnaroundHours": 24, "annualDiscountPercent": 20}
plan-family	{"id": "plan-family", "tier": "Family Pack", "isActive": true, "garmentCap": 200, "monthlyPaise": 199900, "turnaroundHours": 36, "annualDiscountPercent": 20}
\.


--
-- Data for Name: processed_events; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.processed_events (event_id) FROM stdin;
payment:order_fake_2d4bbd39-2bf
payment:order_fake_1e0ff898-134
payment:order_fake_1159b3bf-041
payment:order_fake_54707b20-a32
payment:order_fake_02554376-f78
payment:order_fake_588b73d5-fce
payment:order_fake_597c1654-aca
payment:order_fake_750cbb84-a37
payment:order_fake_9adc64b1-3c8
payment:order_fake_311b194d-c49
payment:order_fake_63044c98-689
payment:order_fake_edd5f38f-c50
payment:order_fake_3071df1b-450
payment:order_fake_e013e564-34a
payment:order_fake_b83312c6-0b8
payment:order_fake_7ba4b315-b65
payment:order_fake_1b237cc7-b09
payment:order_fake_c94f1b74-c2f
\.


--
-- Data for Name: residents; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.residents (id, doc) FROM stdin;
res-demo	{"id": "res-demo", "userId": "user-res", "societyId": "soc-demo", "towerBlock": "A", "unitNumber": "A-101", "preferredWindows": ["Morning"]}
4da46074-42ef-44bb-bb72-d1f7648a74f0	{"id": "4da46074-42ef-44bb-bb72-d1f7648a74f0", "userId": "5a029d78-c082-472b-a73c-10127e9b66f3", "societyId": "string", "towerBlock": "string", "unitNumber": "string", "preferredWindows": ["string"]}
787fba11-ef55-4125-8ab0-aab6c67d3483	{"id": "787fba11-ef55-4125-8ab0-aab6c67d3483", "userId": "5a029d78-c082-472b-a73c-10127e9b66f3", "societyId": "string", "towerBlock": "string", "unitNumber": "string", "preferredWindows": ["string"]}
41fce87a-1462-49e4-b030-c61c37b87177	{"id": "41fce87a-1462-49e4-b030-c61c37b87177", "userId": "5a029d78-c082-472b-a73c-10127e9b66f3", "societyId": "svr1", "towerBlock": "A", "unitNumber": "101", "preferredWindows": ["morning"]}
364104de-da21-4cb5-8a68-d0bd083197fa	{"id": "364104de-da21-4cb5-8a68-d0bd083197fa", "userId": "5a029d78-c082-472b-a73c-10127e9b66f3", "societyId": "svr1", "towerBlock": "A", "unitNumber": "101", "preferredWindows": ["morning"]}
08c6b6b7-89db-4403-ad62-cc212e2de186	{"id": "08c6b6b7-89db-4403-ad62-cc212e2de186", "userId": "5a029d78-c082-472b-a73c-10127e9b66f3", "societyId": "svr1", "towerBlock": "A", "unitNumber": "101", "preferredWindows": ["morning"]}
cc8d2e1e-4a50-4185-a91d-f5416b9f81b4	{"id": "cc8d2e1e-4a50-4185-a91d-f5416b9f81b4", "userId": "5a029d78-c082-472b-a73c-10127e9b66f3", "societyId": "svr1", "towerBlock": "A", "unitNumber": "101", "preferredWindows": ["morning"]}
1273af1a-5057-47c7-918b-0067533978f3	{"id": "1273af1a-5057-47c7-918b-0067533978f3", "userId": "5a029d78-c082-472b-a73c-10127e9b66f3", "societyId": "svr1", "towerBlock": "A", "unitNumber": "101", "preferredWindows": ["morning"]}
987368b9-3ba5-4018-b791-280fd37ae8c1	{"id": "987368b9-3ba5-4018-b791-280fd37ae8c1", "userId": "e8005666-941f-41a5-91e9-d395d657d217", "societyId": "svr1", "towerBlock": "A", "unitNumber": "101", "preferredWindows": ["morning"]}
83b491cb-b707-4f8d-86b2-7d591eb7c93d	{"id": "83b491cb-b707-4f8d-86b2-7d591eb7c93d", "userId": "e8005666-941f-41a5-91e9-d395d657d217", "societyId": "tower1", "towerBlock": "A", "unitNumber": "101", "preferredWindows": ["morning"]}
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.sessions (token, doc) FROM stdin;
\.


--
-- Data for Name: slots; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.slots (id, doc, capacity_remaining, is_active) FROM stdin;
9c35ada4-83ac-4bcd-bd37-32e3b9319269	{"id": "9c35ada4-83ac-4bcd-bd37-32e3b9319269", "date": "2026-08-10", "window": "Evening", "endTime": "20:00", "isActive": true, "societyId": "soc-demo", "startTime": "17:00", "capacityTotal": 20, "capacityRemaining": 20}	20	t
5f70d7a3-37d6-4d59-ae8c-a00e4c8b0e11	{"id": "5f70d7a3-37d6-4d59-ae8c-a00e4c8b0e11", "date": "2026-08-11", "window": "Afternoon", "endTime": "16:00", "isActive": true, "societyId": "soc-demo", "startTime": "13:00", "capacityTotal": 20, "capacityRemaining": 20}	20	t
fd4678a0-6336-4a09-a141-4656946d1c12	{"id": "fd4678a0-6336-4a09-a141-4656946d1c12", "date": "2026-08-11", "window": "Evening", "endTime": "20:00", "isActive": true, "societyId": "soc-demo", "startTime": "17:00", "capacityTotal": 20, "capacityRemaining": 20}	20	t
1be5172e-f1cb-423a-b6a3-01313b18d91e	{"id": "1be5172e-f1cb-423a-b6a3-01313b18d91e", "date": "2026-08-10", "window": "Afternoon", "endTime": "16:00", "isActive": true, "societyId": "soc-demo", "startTime": "13:00", "capacityTotal": 20, "capacityRemaining": 20}	19	t
72eb90ba-21d3-4147-9e08-e205373980bc	{"id": "72eb90ba-21d3-4147-9e08-e205373980bc", "date": "2026-08-10", "window": "Morning", "endTime": "11:00", "isActive": true, "societyId": "soc-demo", "startTime": "08:00", "capacityTotal": 20, "capacityRemaining": 20}	18	t
572f28b2-f00d-4f34-9145-9c5ae512d5c7	{"id": "572f28b2-f00d-4f34-9145-9c5ae512d5c7", "date": "2026-08-11", "window": "Morning", "endTime": "11:00", "isActive": true, "societyId": "soc-demo", "startTime": "08:00", "capacityTotal": 20, "capacityRemaining": 20}	19	t
\.


--
-- Data for Name: societies; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.societies (id, doc) FROM stdin;
soc-demo	{"id": "soc-demo", "city": "Hyderabad", "name": "Green Meadows", "state": "Telangana", "status": "active"}
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.subscriptions (id, doc) FROM stdin;
9764f641-b890-410d-b703-8c001815a7fb	{"id": "9764f641-b890-410d-b703-8c001815a7fb", "cycle": "monthly", "planId": "plan-basic", "status": "cancelled", "cycleEnd": "2026-09-09T13:29:02.537Z", "autoRenew": true, "cycleStart": "2026-08-10T13:29:02.537Z", "pauseUntil": null, "residentId": "res-demo", "cancelReason": "User requested", "garmentsUsed": 0, "pendingPlanId": "plan-basic"}
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.tickets (id, doc) FROM stdin;
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.units (id, doc) FROM stdin;
unit-demo	{"id": "unit-demo", "name": "Green Meadows Unit", "status": "active", "societyId": "soc-demo", "baseDrawPaise": 1500000, "operatorUserIds": ["user-op"], "revenueSharePercent": 15, "waterRecyclingEnabled": true}
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.users (id, doc) FROM stdin;
user-res	{"id": "user-res", "phone": "9876543210", "roles": ["resident"], "status": "active", "fullName": "Asha", "lastLoginAt": "2026-08-12T07:20:36.198Z"}
user-admin	{"id": "user-admin", "phone": "9876500001", "roles": ["admin"], "status": "active", "fullName": "Admin", "lastLoginAt": "2026-08-12T07:22:05.414Z"}
a93761fd-40e1-4a1f-b9f5-67bc39703607	{"id": "a93761fd-40e1-4a1f-b9f5-67bc39703607", "phone": "9987650000", "roles": ["resident"], "status": "active", "fullName": null, "lastLoginAt": "2026-08-12T07:23:01.829Z"}
user-op	{"id": "user-op", "phone": "9876500002", "roles": ["operator"], "status": "active", "fullName": "Unit Operator", "lastLoginAt": "2026-08-12T07:23:30.132Z"}
7df43e8c-5938-42fb-a633-315377c5c722	{"id": "7df43e8c-5938-42fb-a633-315377c5c722", "phone": "9876543211", "roles": ["resident"], "status": "active", "fullName": null, "lastLoginAt": "2026-08-13T05:19:53.491Z"}
5a029d78-c082-472b-a73c-10127e9b66f3	{"id": "5a029d78-c082-472b-a73c-10127e9b66f3", "phone": "9876500003", "roles": ["resident"], "status": "active", "fullName": "test1", "lastLoginAt": "2026-08-13T07:01:17.860Z"}
e8005666-941f-41a5-91e9-d395d657d217	{"id": "e8005666-941f-41a5-91e9-d395d657d217", "phone": "9876500000", "roles": ["resident"], "status": "active", "fullName": "test1", "lastLoginAt": "2026-08-13T07:31:04.680Z"}
\.


--
-- Data for Name: water_logs; Type: TABLE DATA; Schema: public; Owner: washnpress
--

COPY public.water_logs (id, doc) FROM stdin;
\.


--
-- Name: addons addons_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.addons
    ADD CONSTRAINT addons_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: ledger_txn ledger_txn_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.ledger_txn
    ADD CONSTRAINT ledger_txn_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: outbox_events outbox_events_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.outbox_events
    ADD CONSTRAINT outbox_events_pkey PRIMARY KEY (id);


--
-- Name: payment_intents payment_intents_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.payment_intents
    ADD CONSTRAINT payment_intents_pkey PRIMARY KEY (id);


--
-- Name: pickups pickups_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.pickups
    ADD CONSTRAINT pickups_pkey PRIMARY KEY (id);


--
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: processed_events processed_events_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.processed_events
    ADD CONSTRAINT processed_events_pkey PRIMARY KEY (event_id);


--
-- Name: residents residents_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.residents
    ADD CONSTRAINT residents_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (token);


--
-- Name: slots slots_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_pkey PRIMARY KEY (id);


--
-- Name: societies societies_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.societies
    ADD CONSTRAINT societies_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: water_logs water_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: washnpress
--

ALTER TABLE ONLY public.water_logs
    ADD CONSTRAINT water_logs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict zzCRCuc667XetDUkIogJyU3TGJi52r0GdG8hc6YcBTrVCmlyUCYgJuGoNeURKJL

