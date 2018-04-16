#!/bin/sh
webhook -urlprefix "${WEBHOOK_URL_PREFIX}" -hooks  /usr/local/bin/hooks.json  -verbose &
update.sh
apachectl -d /etc/apache2 -f apache2.conf  -DFOREGROUND

