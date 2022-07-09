ARG PHP_VERSION=7.1

FROM php:${PHP_VERSION}-fpm-alpine as base

WORKDIR /www

RUN docker-php-ext-install pdo pdo_mysql

FROM base as composer

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

ENTRYPOINT [ "composer" ]
