FROM php:8.2-bookworm as base
WORKDIR /app
RUN export MAKEFLAGS="-j $(nproc)" && pecl install swoole redis && \
    docker-php-ext-enable swoole redis && docker-php-ext-install -j$(nproc) pcntl opcache
COPY z_custom.ini /usr/local/etc/php/conf.d/
EXPOSE 8000
ENTRYPOINT [ "php", "artisan", "octane:start", "--host=0.0.0.0" ]

FROM composer as builder
COPY composer.json composer.lock ./
RUN composer install --no-autoloader
COPY . .
RUN composer install

FROM base
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY --from=builder /app .