# syntax=docker/dockerfile:1

ARG NODE_VERSION=18.16.0


FROM node:${NODE_VERSION}-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN addgroup app && adduser -S -G app app

USER root

RUN npm ci --production

COPY  . .

# # Expose the port that the application listens on.
# EXPOSE 3000

# CMD npm run build
