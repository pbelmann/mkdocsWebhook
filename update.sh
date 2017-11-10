#!/bin/sh
(
     flock -n 9 || exit 1
     rm -rf /srv_root/docs/*
     wget -qO- $REPOSITORY | tar xzv --strip-components=1 -C /srv_root/docs
     mkdocs build --clean --config-file=/srv_root/docs/config.yml
) 9>/var/lock/update.lock
