#!/bin/sh

# == CONFIG ==
# container mysql
mysql='mysql'
format="%F_%T"
# ===

if [ -z "${1}" ]; then
    echo "[ERROR] Not database name given"
    echo "usage: ${0} <database_name>"
    exit 1
fi

dbname=${1}
filename="${dbname}_$(date +"${format}").sql"
dirname=$(dirname "${0}")
path="${dirname}/../backup/"${filename}


docker exec ${mysql} sh -c "mysqldump ${dbname}" > ${path}

if [ $? != 0 ]; then
    echo '[ERROR] Dump failed'
    exit 2
fi

realpath --relative-to=$(pwd) $path

