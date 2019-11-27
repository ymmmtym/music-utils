FROM nginx:alpine
LABEL Maintainer "ymmmtym"

COPY [".", "/usr/share/nginx/html"]
COPY ["./default.conf", "/etc/nginx/conf.d/"]
EXPOSE 8080