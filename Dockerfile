ARG PHP_VERSION=8.3

FROM dunglas/frankenphp:php${PHP_VERSION}-alpine AS base

WORKDIR /app

RUN install-php-extensions pdo pdo_mysql

FROM base AS composer

WORKDIR /app

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

ENTRYPOINT [ "composer" ]
CMD [ "install", "--no-interaction", "--prefer-dist" ]

FROM base AS phpcs

WORKDIR /app

ENTRYPOINT [  "php", "vendor/bin/phpcs" ]

FROM composer AS deps

WORKDIR /app

COPY composer.* .
RUN composer install --no-interaction --prefer-dist

FROM base AS runtime

WORKDIR /app

COPY . .
COPY --from=deps /app/vendor ./vendor

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY config/php.ini "$PHP_INI_DIR/conf.d/app.ini"
