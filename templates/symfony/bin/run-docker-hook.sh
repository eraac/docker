#!/bin/sh

# == CONFIG ==
uuid='xxx' # use uuidgen
script='sh /path/to/bin/deploy.sh'
port='8555'
# ====

nohup docker-hook -t ${uuid} -c ${script} --port ${port} > /dev/null 2>&1 &
