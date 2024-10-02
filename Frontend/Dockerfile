FROM oven/bun:latest as build

WORKDIR /app

COPY bun.lockb package.json ./
RUN bun install

COPY . .

RUN bun run build

FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

