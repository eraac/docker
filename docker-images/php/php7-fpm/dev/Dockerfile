FROM php:7-fpm-alpine

MAINTAINER Kévin Labesse <kevin@labesse.me>

WORKDIR /var/www

# install "composer"
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

COPY php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY php.ini /etc/php7/conf.d/50-setting.ini

RUN chown -R www-data:www-data /var/www

