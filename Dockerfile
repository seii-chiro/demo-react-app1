FROM node:24-slim AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM alpine:latest
COPY --from=builder /app/dist /html
CMD ["sh", "-c", "cp -r /html/* /target/"]