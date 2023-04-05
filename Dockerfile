FROM php:fpm-alpine

COPY 99_custom.ini /usr/local/etc/php/conf.d/
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && docker-php-ext-enable opcache && \
    wget https://raw.githubusercontent.com/composer/getcomposer.org/main/web/installer -O - -q | php -- --install-dir="/usr/local/bin/" --filename="composer"
COPY --chown=www-data:www-data html .
USER www-data
RUN composer install