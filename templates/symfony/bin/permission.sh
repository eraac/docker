#!/bin/sh

docker-compose exec php sh -c "chmod -R 665 /var/www/symfony/var/logs"
docker-compose exec php sh -c "chmod -R 665 /var/www/symfony/var/cache"
