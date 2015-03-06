#!/bin/sh
set -e
set -x

if [ $(grep -ci $CUPS_USER_ADMIN /etc/shadow) -eq 0 ]; then
    useradd $CUPS_USER_ADMIN --system -G root --no-create-home --password $(openssl passwd -1 $CUPS_USER_PASSWORD)
fi

exec /usr/sbin/cupsd -f
