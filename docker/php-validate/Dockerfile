FROM php:8.0-fpm
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug
RUN apt-get update
RUN apt-get install -y git libzip-dev vim
RUN docker-php-ext-install zip
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN printf '[PHP]\ndate.timezone = "Asia/Tokyo"\n' > /usr/local/etc/php/conf.d/tzone.ini
COPY ./docker/php/uploads.ini /usr/local/etc/php/conf.d/uploads.ini
