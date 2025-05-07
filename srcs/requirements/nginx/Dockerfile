FROM	alpine:3.20

RUN apk update && \
 apk add nginx openssl

RUN	mkdir /keys && cd /keys && openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out example.crt \
            -keyout example.key \
            -subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=42Madrid/CN=smeixoei.42.fr"

COPY	conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE	443

CMD ["-c", "/etc/nginx/nginx.conf"]

ENTRYPOINT ["nginx"]
