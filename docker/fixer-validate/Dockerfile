FROM php:7.3-fpm
ADD ./docker/fixer/php-cs-fixer-v2.phar /usr/local/bin/php-cs-fixer
RUN ["chmod", "+x", "/usr/local/bin/php-cs-fixer"]
VOLUME ["/var/www/backend"]
WORKDIR /var/www/backend
ENTRYPOINT ["php-cs-fixer"]
CMD ["--version"]
