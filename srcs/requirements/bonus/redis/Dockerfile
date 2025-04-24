FROM alpine:3.20

RUN apk update && apk add redis

COPY conf/redis.conf /etc/redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis.conf"] 
