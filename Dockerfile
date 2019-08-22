FROM php:fpm

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN docker-php-ext-install -j$(nproc) pdo_mysql