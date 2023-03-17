#!/bin/sh

git clone https://github.com/5ym/docker-laravel-jit.git
cd docker-laravel-jit
cp docker-compose.sample.yml docker-compose.yml
docker compose run --rm web sh -c "composer create-project laravel/laravel ."