FROM nginx:alpine-slim

COPY default.conf /etc/nginx/conf.d/
RUN touch /var/run/nginx.pid && chown -R nginx:nginx /var/cache/nginx /var/run/nginx.pid
USER nginx
WORKDIR /var/www/html