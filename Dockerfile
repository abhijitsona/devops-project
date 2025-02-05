FROM docker.io/library/alpine:latest

COPY . /usr/share/nginx/html

EXPOSE 80
