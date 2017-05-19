#!/bin/bash

[ ! -f /config/settings.json ] && {
  echo "no settings.json found, seeding with defaults..."
  mkdir -p /transmission/{config,watch,downloads,incomplete}
  cp /var/lib/transmission-daemon/settings.json /transmission/config/settings.json
}

exec /usr/bin/transmission-daemon --foreground --config-dir /transmission/config \
  --log-info  --peerport 45555 --auth --username ${USERNAME} --password ${PASSWORD} \
  --watch-dir /transmission/watch --download-dir /transmission/downloads --incomplete-dir /transmission/incomplete
