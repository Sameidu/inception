FROM alpine:3.20

RUN apk update && apk add php php-fpm php-mysqli php-session wget

COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

WORKDIR /adminer

RUN wget -O adminer.php https://github.com/vrana/adminer/releases/download/v5.2.1/adminer-5.2.1.php

CMD [ "php-fpm83", "-F" ]
