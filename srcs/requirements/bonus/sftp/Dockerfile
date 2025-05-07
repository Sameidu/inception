FROM alpine:3.20

RUN apk update && apk add openssh openssh-sftp-server

RUN ssh-keygen -A

COPY conf/sshd_config /etc/ssh/sshd_config

WORKDIR /wordpress

COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]
