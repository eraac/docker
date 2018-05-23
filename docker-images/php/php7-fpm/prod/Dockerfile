FROM php:7.2-fpm-alpine

MAINTAINER Kévin Labesse <kevin@labesse.me>

WORKDIR /var/www

RUN set -x && \
    apk --update add \
      zlib-dev \
      icu \
      bzip2-dev \
      icu-libs \
      icu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
       iconv \
       intl \
       pdo \
       pdo_mysql \
       mbstring \
       opcache \
       zip \
       exif \
       bz2 \
    && rm -rf /var/cache/apk/*

COPY php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY php.ini /usr/local/etc/php/conf.d/

# override conf php: /usr/local/etc/php/php.ini
