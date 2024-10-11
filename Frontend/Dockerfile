FROM oven/bun:latest AS build

WORKDIR /app

COPY package.json ./
RUN bun install

COPY . .
RUN bun run tailwind
RUN bun run build

FROM node:alpine AS production

WORKDIR /app

COPY --from=build /app/dist ./dist

RUN npm install -g serve

EXPOSE 5173

CMD ["serve", "-s", "dist", "-l", "5173"]
