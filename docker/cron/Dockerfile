FROM php:8.0-fpm
ARG BE_SRC_CODE
ARG BE_DEST_CODE
ARG TIMEZONE
RUN apt-get update
RUN apt-get install -y git cron
RUN echo "* * * * * www-data php $BE_DEST_CODE/artisan schedule:run >> /dev/null 2>&1" >> /etc/crontab
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN service cron start
RUN printf "[PHP]\ndate.timezone = \"$TIMEZONE\"\n" > /usr/local/etc/php/conf.d/tzone.ini
COPY $BE_SRC_CODE $BE_DEST_CODE
RUN chown -R www-data:www-data $BE_DEST_CODE
ADD ./docker/cron/scripts/configure.sh /configure.sh
RUN ["chmod", "+x", "/configure.sh"]
CMD /configure.sh
