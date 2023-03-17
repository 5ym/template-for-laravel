#!/bin/sh

git clone https://github.com/5ym/docker-laravel-jit.git
cd docker-laravel-jit
cp docker-compose.sample.yml docker-compose.yml
docker compose run --rm -u root web sh -c "chown -R nginx:nginx ."
docker compose run --rm web sh -c "composer create-project laravel/laravel . && chmod -R 777 . && sed -i -e 's/.env$//g' .gitignore"
sed -i -e 's/\/html//g' .gitignore
docker compose up