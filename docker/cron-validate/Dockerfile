FROM php:7.3-fpm
RUN apt-get update
RUN apt-get install -y git cron
RUN echo "* * * * * www-data php /var/www/backend/artisan schedule:run >> /dev/null 2>&1" >> /etc/crontab
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN service cron start
RUN printf '[PHP]\ndate.timezone = "Asia/Tokyo"\n' > /usr/local/etc/php/conf.d/tzone.ini
COPY ./src/backend /var/www/backend
RUN chown -R www-data:www-data /var/www/backend
ADD ./docker/cron/scripts/configure.sh /configure.sh
RUN ["chmod", "+x", "/configure.sh"]
CMD /configure.sh