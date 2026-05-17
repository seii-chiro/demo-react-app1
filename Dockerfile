FROM node:24-slim AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


FROM alpine:latest

COPY --from=builder /app/dist /html

CMD ["sh", "-c", "mkdir -p /target && cp -r /html/. /target/"]