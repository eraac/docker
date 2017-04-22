#!/bin/sh

if [[ ${1} -eq 0 ]] ; then
    echo 'CA pem missing'
    exit 1
fi

if [[ ${2} -eq 0 ]] ; then
    echo 'CA key missing'
    exit 1
fi

if [[ ${3} -eq 0 ]] ; then
    echo 'Serial number missing'
    exit 1
fi

openssl genrsa -out client.key 2048
openssl req -key client.key -new -out client.req
openssl x509 -req -in client.req -CA ${1} -CAkey ${2} -set_serial ${3} -out client.pem

