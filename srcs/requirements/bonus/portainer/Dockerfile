FROM alpine:3.20

RUN apk add --no-cache \
    curl \
    ca-certificates \
    && rm -rf /var/cache/apk/*

RUN curl -L https://github.com/portainer/portainer/releases/download/2.29.2/portainer-2.29.2-linux-amd64.tar.gz -o portainer.tar.gz \
&& tar -xvzf portainer.tar.gz \
    && mv portainer/portainer /portainer \
    && rm -rf portainer.tar.gz 

RUN chmod +x /portainer/portainer
RUN mkdir -p /data

EXPOSE 9000 9443


CMD ["/portainer/portainer", "--no-ssl"]
