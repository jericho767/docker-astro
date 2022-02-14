# base image
FROM node:lts-slim
WORKDIR /var/www/frontend
ENV PATH /var/www/frontend/node_modules/.bin:$PATH
COPY ./src/frontend /var/www/frontend
RUN npm install -g react-scripts
RUN npm install --save
