FROM php:7-fpm-alpine

MAINTAINER Kévin Labesse <kevin@labesse.me>

WORKDIR /var/www

# install "composer"
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

RUN set -x && \
    apk --update add \
      zlib-dev \
      icu \
      icu-libs \
      icu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
       iconv \
       intl \
       pdo \
       pdo_mysql \
       mbstring \
       zip \
       exif \
       bz2 \
    && rm -rf /var/cache/apk/*

COPY php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY php.ini /usr/local/etc/php/conf.d/

# override conf php: /usr/local/etc/php/php.ini
