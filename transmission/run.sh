#!/bin/bash

[ ! -f /config/settings.json ] && cp /var/lib/transmission-daemon/settings.json /config/settings.json

/usr/bin/transmission-daemon --foreground --config-dir /config --log-info  --peerport 45555 --auth --username ${USERNAME} --password ${PASSWORD} --watch-dir /watch --download-dir /downloads --incomplete-dir /incomplete
