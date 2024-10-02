FROM oven/bun:latest

WORKDIR /app

COPY bun.lockb package.json ./
RUN bun install

COPY . .

EXPOSE 5000

CMD ["bun", "server.js"]

