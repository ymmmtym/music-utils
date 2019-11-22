FROM nginx:alpine
COPY ["./tracklist", "/usr/share/nginx/html"]
EXPOSE 80