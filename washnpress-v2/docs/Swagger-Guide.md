# WashNPress API Swagger Guide

This document explains how to use the Swagger UI to view and interact with the WashNPress API.

## Starting Swagger UI

The Swagger UI is included as a service in the existing Docker Compose configuration.

To start it independently (without starting the full backend stack in Docker, since you may be running the Fastify backend locally via `npm start`), run:

```bash
docker compose up -d swagger-ui
```

## Accessing the Documentation

Once the container is running, open your browser and navigate to:

[http://localhost:8081](http://localhost:8081)

## Using "Try it out"

1. Click on any endpoint to expand its details.
2. Click the **"Try it out"** button in the top right of the endpoint section.
3. Fill in any required parameters (e.g., `id`, `date`, or request body).
4. Click **Execute** to send a live request to the Fastify backend (`http://localhost:8080`).

## Authentication (Protected Endpoints)

Many endpoints require authentication (Session/Bearer token).

1. Find an endpoint that generates a token (e.g., `POST /v1/auth/otp/verify`).
2. Execute the endpoint with a valid payload to receive a `token` in the response.
3. Click the **"Authorize"** button at the top of the Swagger UI page (or the padlock icon next to a protected endpoint).
4. Paste the `token` into the Bearer token field and click **Authorize**.
5. Future requests to protected endpoints will now include this token in the `Authorization` header.

## Interpreting Responses

The API follows a standard response format:
- Successful operations generally return `200 OK` or `201 Created` with a JSON body representing the resource.
- Errors return `400`, `401`, `402`, `403`, `404`, or `409` HTTP status codes.
- Error payloads typically look like: `{ "error": "error_code", "message": "human readable message" }`.

## Validating the OpenAPI Specification

The `docs/openapi.json` file adheres to OpenAPI 3.0.3 standards. You can validate it using standard tools like `swagger-cli` or by copying the JSON into the [Swagger Editor](https://editor.swagger.io/).
