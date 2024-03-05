FROM imbios/bun-node:latest as builder

USER node
WORKDIR /home/node

COPY package*.json ./
COPY bun.lockb ./
RUN bun i 

COPY --chown=node:node . .
RUN bun run build 

CMD ["node", "dist/main"]