#!/bin/bash

# == CONFIG ==
container="influxdb"
format="%s"
# == END CONFIG ==

if [ -z "${1}" ]; then
    echo "[ERROR] No database name given"
    echo "usage: ${0} <database_name>"
    exit 1
fi

dbname=${1}
directory="${dbname}_$(date +"${format}")"
dirname=$(dirname ${0})
path="${dirname}/../backup/${directory}"
archive=${path}.tar.gz

docker exec ${container} sh -c "influxd backup -portable -database ${dbname} -host localhost:8088 /tmp/${directory} && cd /tmp && tar -cf ${directory}.tar.gz ${directory} && rm -r /tmp/${directory}"

if [ $? != 0 ]; then
    echo "[ERROR] dump fail"
    exit 2
fi


echo ${container}-${directory}-${archive}

docker cp ${container}:/tmp/${directory}.tar.gz ${archive}

realpath --relative-to=$(pwd) ${archive}

