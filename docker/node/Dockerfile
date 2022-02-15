# base image
FROM node:lts-slim
ARG FE_SRC_DIR
ARG FE_DEST_DIR
WORKDIR $FE_DEST_DIR
ENV PATH $FE_DEST_DIR/node_modules/.bin:$PATH
COPY $FE_SRC_DIR $FE_DEST_DIR
RUN npm install -g react-scripts
RUN npm install --save
