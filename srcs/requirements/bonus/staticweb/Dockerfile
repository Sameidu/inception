FROM alpine:3.20

RUN apk update && apk add nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/index.html /staticweb/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
