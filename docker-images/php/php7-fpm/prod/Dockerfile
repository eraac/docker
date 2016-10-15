FROM php:7-fpm-alpine

MAINTAINER Kévin Labesse <kevin@labesse.me>

WORKDIR /var/www

COPY php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY php.ini /etc/php7/conf.d/50-setting.ini

RUN chown -R www-data:www-data /var/www

