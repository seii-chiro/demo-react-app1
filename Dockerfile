FROM node:24-slim AS builder

WORKDIR /app
ARG VITE_BASE_URL
ENV VITE_BASE_URL=$VITE_BASE_URL

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


FROM alpine:latest

COPY --from=builder /app/dist /html

CMD ["sh", "-c", "mkdir -p /target && cp -r /html/. /target/"]
