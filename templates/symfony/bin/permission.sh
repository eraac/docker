#!/bin/sh

docker-compose exec php sh -c "chown -R www-data:www-data /var/www/var/logs"
docker-compose exec php sh -c "chown -R www-data:www-data /var/www/var/cache"
docker-compose exec php sh -c "chown -R www-data:www-data /var/www/var/sessions"

