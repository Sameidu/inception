FROM alpine:3.20

RUN apk update && apk add mariadb mariadb-client

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY conf/my.cnf /etc/mysql/my.cnf

COPY conf/my.cnf /etc/my.cnf

COPY tools/setup.sh /tools/setup.sh

RUN chmod +x /tools/setup.sh

CMD ["/tools/setup.sh"]
