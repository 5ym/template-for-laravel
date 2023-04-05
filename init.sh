#!/bin/sh

docker run -it -v $(pwd):/app --rm --entrypoint bash composer:2.6 -c 'composer global require laravel/installer && /tmp/vendor/bin/laravel new -q app'
cd app
wget https://raw.githubusercontent.com/5ym/template-for-laravel/main/compose.sample.yml
wget https://raw.githubusercontent.com/5ym/template-for-laravel/main/Dockerfile
wget https://raw.githubusercontent.com/5ym/template-for-laravel/main/z_custom.ini
cp compose.sample.yml compose.yml
rm -f .env
docker compose run --rm --entrypoint bash template -c 'composer require laravel/octane && php artisan octane:install --server=swoole && npm install --save-dev chokidar'
echo compose.yml >> .gitignore
cp .gitignore .dockerignore
docker compose up