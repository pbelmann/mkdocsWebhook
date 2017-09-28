#!/bin/sh

(
     flock -n 9 || exit 1
     wget $REPOSITORY -O /tmp/temp.tar.gz 
     tar xzvf /tmp/temp.tar.gz --strip-components=1 -C /srv_root/docs
     mkdocs build --clean --config-file=/usr/local/bin/config.yml 

) 9>/var/lock/update.lock
