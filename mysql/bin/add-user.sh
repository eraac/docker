#!/bin/sh

# == CONFIG ==
# container mysql
mysql='mysql'
# ===

if [ -z "${1}"]; then
    echo "[ERROR] Not user given"
    echo "usage: ${0} <username>"
    exit 1
fi

user=$1
host='%'
password=`cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`

docker exec ${mysql} sh -c "mysql -e 'CREATE USER '\''${user}'\''@'\''${host}'\'' IDENTIFIED BY '\''${password}'\'';'"

if [ $? != 0 ]; then
    echo '[ERROR] Create user failed'
    exit 2
fi

docker exec ${mysql} sh -c "mysql -e 'CREATE DATABASE IF NOT EXISTS \`${user}\`;'"

if [ $? != 0 ]; then
    echo '[ERROR] Create database failed'
    exit 3
fi

docker exec ${mysql} sh -c "mysql -e 'GRANT ALL PRIVILEGES ON \`${user}\`.* TO '\''${user}'\''@'\''${host}'\'';'"

if [ $? != 0 ]; then
    echo '[ERROR] Grant all privileges failed'
    exit 4
fi

echo $password
