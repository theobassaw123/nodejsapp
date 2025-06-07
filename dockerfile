FROM node:20-slim AS builder

WORKDIR /src

COPY package*.json

RUN npm install

COPY . .

FROM node:20-alpine

WORKDIR /src /app

COPY --from=builder /src /app

EXPOSE 3000

CMD ['node','index.js']
