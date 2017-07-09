#!/usr/bin/env bash

path=${1:-/rips}
device=${2:-/dev/sr0}
shift 2
disc=${device: -1}

function isDvd() {
  lsdvd ${device} &> /dev/null
}

function isBd() {
  bd_info ${device} &>/dev/null
}

function getLabel() {
  if [[ $1 == dvd ]]; then
    lsdvd ${device} | sed -ne '/^Disc Title: / s/^.*Title: //p' -e 's/[[:space:]]/_/'
  else
    bd_info ${device} 2>/dev/null | sed -ne '/^Volume Identifier/ s/^.*Identifier *: *//p' -e 's/[[:space:]]/_/'
  fi
}

function ripDvd() {
  exec dvdbackup -p -v -M -i ${device} -o ${path}
}

function ripBd() {
  KEY=$(curl "http://www.makemkv.com/forum2/viewtopic.php?f=5&t=1053" -s | awk 'FNR == 243 {print $57}' | cut -c 21-88)

  mkdir -p ${HOME}/.MakeMKV
  echo "app_Key = \"${KEY}\"" > ${HOME}/.MakeMKV/settings.conf
  label=$(getLabel 'bd')
  exec makemkvcon backup --decrypt --progress=-stdout --robot disc:${disc} ${path}/${label}
}

isDvd && {
  ripDvd "$@"
  exit $?
}

isBd && {
  ripBd "$@"
  exit $?
}
echo "Unknown Disc type. Can't rip this."
exit 1
