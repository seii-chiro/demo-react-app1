# react-app1 Setup Guide

`react-app1` is a React/Vite frontend served through Nginx on port `9001`.

## Prerequisites

- Docker Desktop
- Docker Compose
- External Docker network named `app-network`
- `microservice1` running on `http://localhost:9000` if the frontend needs API access

## Docker Setup

1. Create the shared Docker network if it does not exist:

   ```bash
   docker network create app-network
   ```

2. Create or update `.env`:

   ```env
   VITE_BASE_URL=http://localhost:9000
   ```

3. Build and start the frontend:

   ```bash
   docker compose up -d --build
   ```

Open:

```text
http://localhost:9001
```

## Local Setup

```bash
npm install
npm run dev
```

## Useful Commands

```bash
npm run build
npm run lint
docker compose down
```

