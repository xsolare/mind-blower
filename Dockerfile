FROM node:18.14.2-alpine

WORKDIR /opt/ggd

COPY ./source .

RUN apk add wget
RUN wget -qO /bin/pnpm "https://github.com/pnpm/pnpm/releases/latest/download/pnpm-linuxstatic-x64" && chmod +x /bin/pnpm

RUN pnpm i --ignore-scripts
RUN pnpm run build

ENV HOST 0.0.0.0
CMD ["pnpm", "start"]
