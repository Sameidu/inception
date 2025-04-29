#!/bin/bash

if ! id -u "$COCKPIT_USER" >/dev/null 2>&1; then
    echo "El usuario $COCKPIT_USER no existe. Creando el usuario..."

    useradd -m "$COCKPIT_USER"

    echo "$COCKPIT_USER:$COCKPIT_PASSWORD" | chpasswd

    usermod -aG sudo "$COCKPIT_USER"

    echo "$COCKPIT_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

else
    echo "El usuario $COCKPIT_USER ya existe."
fi

exec /lib/systemd/systemd
