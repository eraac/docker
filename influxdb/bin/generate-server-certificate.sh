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

openssl genrsa -out server.key 2048
openssl req -key server.key -new -out server.req 
openssl x509 -req -in server.req -CA ${1} -CAkey ${2} -set_serial ${3} -out server.pem 

