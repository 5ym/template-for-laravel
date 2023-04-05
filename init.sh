#!/bin/sh

git clone https://github.com/5ym/docker-laravel-jit.git
cd docker-laravel-jit
cp docker-compose.sample.yml docker-compose.yml
docker run --rm --network host -v ./html:/app composer create-project laravel/laravel .
docker compose run --rm -u root app sh -c "chown -R www-data:www-data . && chmod -R 777 . && sed -i -e 's/.env$//g' .gitignore"
sed -i -e 's/\/html//g' .gitignore
docker compose up