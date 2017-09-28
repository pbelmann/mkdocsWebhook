#!/bin/sh
webhook -urlprefix "wiki/hooks" -hooks  /usr/local/bin/hooks.json  -verbose &
update.sh
cd /srv_root && python -m http.server 8000
