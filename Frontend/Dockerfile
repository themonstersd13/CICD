FROM oven/bun:latest as build

WORKDIR /app

COPY package.json bun.lockb ./
RUN bun install

COPY . .

RUN bun run build

FROM node:alpine as production

WORKDIR /app

RUN npm install -g serve

COPY --from=build /app/dist ./dist

EXPOSE 5173

CMD ["serve", "-s", "dist", "-l", "5173"]
