#!/bin/sh

docker-compose exec php sh -c "chmod -R 665 /var/www/var/logs"
docker-compose exec php sh -c "chmod -R 665 /var/www/var/cache"
