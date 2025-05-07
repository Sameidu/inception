#!/bin/sh

addgroup -g 1001 -S sftp || true

adduser -h /home/$SFTP_USER -s /sbin/nologin -G sftp -D $SFTP_USER

echo "$SFTP_USER:$SFTP_PASS" | chpasswd

mkdir -p /home/$SFTP_USER/files

chown root:root /home/$SFTP_USER
chmod 755 /home/$SFTP_USER

chown -R $SFTP_USER:sftp /home/$SFTP_USER/files

exec /usr/sbin/sshd -D

