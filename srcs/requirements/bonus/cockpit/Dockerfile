FROM debian:11

RUN apt-get update && apt-get install -y systemd dbus cockpit cockpit-bridge cockpit-ws docker.io

RUN systemctl enable cockpit.socket

COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9090

CMD ["/entrypoint.sh"]
