
ARG NODE_VERSION=18.16.0

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV=production

# Load environment variables from .env file
ARG ENV_FILE
ENV ENV_FILE=${ENV_FILE}
COPY $ENV_FILE /.env


WORKDIR /usr/app

COPY package*.json ./
COPY client/package.json /app/client/package.json

# Copy the rest of the source files into the image.
COPY . .

# Run the application as a root user.
USER root

RUN npm i &&  npm install --prefix client && npm run build --prefix client

# Expose the port that the application listens on.
EXPOSE 5050

# Run the application.
CMD npm start 
