FROM nginx:alpine
COPY ["./tracklist", "/usr/share/nginx/html"]
COPY ["./8080.conf", "/etc/nginx/conf.d/"]
EXPOSE 80