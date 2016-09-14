#!/bin/sh

# == CONFIG ==
ifttt_event='xxx'
ifttt_key='xxx'
# ====

cd "$(dirname "$0")/.."

docker-compose pull
docker-compose down
docker-compose up -d

curl --silent -X POST https://maker.ifttt.com/trigger/${ifttt_event}/with/key/${ifttt_key} > /dev/null