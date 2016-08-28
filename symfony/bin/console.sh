#!/bin/sh

docker-compose exec php sh -c "php /var/www/symfony/bin/console ${@}"
