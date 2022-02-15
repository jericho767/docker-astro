FROM php:8.0-fpm
ARG BE_DEST_DIR
ADD ./docker/fixer/php-cs-fixer-v2.phar /usr/local/bin/php-cs-fixer
RUN ["chmod", "+x", "/usr/local/bin/php-cs-fixer"]
VOLUME ["$BE_DEST_DIR"]
WORKDIR $BE_DEST_DIR
ENTRYPOINT ["php-cs-fixer"]
CMD ["--version"]
