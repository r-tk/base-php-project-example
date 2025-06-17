ARG PHP_VERSION=7.1

FROM php:${PHP_VERSION}-fpm-alpine AS base

WORKDIR /www

RUN docker-php-ext-install pdo pdo_mysql

FROM base AS composer

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

ENTRYPOINT [ "composer" ]
CMD [ "install", "--no-interaction", "--prefer-dist" ]

FROM base AS phpcs

WORKDIR /app

ENTRYPOINT [  "php", "vendor/bin/phpcs" ]
