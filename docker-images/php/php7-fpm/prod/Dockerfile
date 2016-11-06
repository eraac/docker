FROM php:7-fpm-alpine

MAINTAINER Kévin Labesse <kevin@labesse.me>

WORKDIR /var/www

# TODO add same package as dev + apc

COPY php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY php.ini /usr/local/etc/php/conf.d/

# override conf php: /usr/local/etc/php/php.ini

RUN chown -R www-data:www-data /var/www

