FROM nginx
ARG API_DOMAIN
ARG APP_DOMAIN
ADD ./docker/nginx/scripts/configure.sh /configure.sh
ADD ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
RUN ["chmod", "+x", "/configure.sh"]
RUN /configure.sh
