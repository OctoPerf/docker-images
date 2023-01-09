FROM nginx:stable-alpine

ENV NGINX_PORT=80
ENV HTML_ROOT=""

COPY default.conf.template /etc/nginx/templates/
COPY 404.html /usr/share/nginx/html/