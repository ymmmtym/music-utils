FROM nginx:alpine
COPY ["./tracklist", "/usr/share/nginx/html"]
COPY ["./default.conf", "/etc/nginx/conf.d/"]
EXPOSE 8080