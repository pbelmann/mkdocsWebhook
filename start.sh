#!/bin/sh
webhook -hooks  /usr/local/bin/hooks.json  -verbose &
cd /site && python -m http.server 8000 
