FROM alpine:3.20

RUN apk update && apk add php \
 php-cli \
 php-fpm \
 php-opcache \
 php-mbstring \
 php-curl \
 mariadb-client \
 php-mysqli \
 php-session \
 php-phar \
 curl \
 bash

WORKDIR /wordpress

COPY tools/entrypoint.sh /wordpress/entrypoint.sh

COPY conf/php.ini /etc/php83/php.ini

RUN chmod +x /wordpress/entrypoint.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

EXPOSE 9000

CMD ["bash", "/wordpress/entrypoint.sh"]
