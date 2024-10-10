FROM oven/bun:latest as build

WORKDIR /app

COPY package.json bun.lockb ./
RUN bun install

COPY . .

EXPOSE 5000

CMD ["bun", "run", "server.js"]
