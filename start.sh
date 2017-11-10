#!/bin/sh
webhook -urlprefix "wiki/hooks" -hooks  /usr/local/bin/hooks.json  -verbose &
update.sh
apachectl -d /etc/apache2 -f apache2.conf  -DFOREGROUND

