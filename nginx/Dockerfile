FROM nginxinc/nginx-unprivileged

ENV NGINX_PORT=8080

COPY --chown=nginx:root default.conf.template /etc/nginx/templates/
COPY --chown=nginx:root 404.html /usr/share/nginx/html/
