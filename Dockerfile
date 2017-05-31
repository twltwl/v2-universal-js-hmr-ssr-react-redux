FROM node:boron

ARG env
ENV API_ENV=${API_ENV:-$env}

RUN mkdir -p /usr/src/app
ADD . /usr/src/app

WORKDIR /usr/src/app
RUN npm install

RUN npm run build

EXPOSE 4711

WORKDIR /usr/src/app/static
CMD [ "npm", "run", "production" ]