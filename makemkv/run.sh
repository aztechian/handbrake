#!/bin/bash

set -x
KEY=$(curl "http://www.makemkv.com/forum2/viewtopic.php?f=5&t=1053" -s | awk 'FNR == 243 {print $57}' | cut -c 21-88)

mkdir -p ${HOME}/.MakeMKV

echo "app_Key = \"${KEY}\"" > ${HOME}/.MakeMKV/settings.conf

set +x
echo "makemkvcon backup --decrypt $@"
exec makemkvcon backup --decrypt $@
