#!/bin/bash

[ ! -f /config/settings.json ] && {
  echo "no settings.json found, seeding with defaults..."
  cp /var/lib/transmission-daemon/settings.json /config/settings.json
}

exec /usr/bin/transmission-daemon --foreground --config-dir /config \
  --log-info  --peerport 45555 --auth --username ${USERNAME} --password ${PASSWORD} \
  --watch-dir /watch --download-dir /downloads --incomplete-dir /incomplete
