FROM nginxinc/nginx-unprivileged

ENV NGINX_PORT=8080
ENV HTML_ROOT=""

COPY default.conf.template /etc/nginx/templates/
COPY 404.html /usr/share/nginx/html/
