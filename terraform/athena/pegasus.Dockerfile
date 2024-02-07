FROM node

WORKDIR /app

ENTRYPOINT yarn && yarn run local