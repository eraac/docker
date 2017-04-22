# Influxdb

## Get started

- Create network for influxdb (see `bin/create-network.sh`)
- Change default username/password in `config/influxdb/influxdb.conf`
- Generate your server certificate (see `bin/generate-server-certificate.sh`)
- Create an admin user for influxdb
- For each client generate a client certificate (see `bin/generate-client-certificate.sh`)

## Help

- Connection to the CLI the first time:

`influx -ssl -unsafeSsl`

- Connection to the CLI (after you have create your first user):

`influx -ssl -unsafeSsl -username <username> -password ''`

- Create admin user:

`CREATE USER <username> WITH PASSWORD '<password>' WITH ALL PRIVILEGES`
