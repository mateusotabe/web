# FROM php:fpm
# 
# RUN apt-get update && apt-get install -y \
#     git \
#     curl \
#     libpng-dev \
#     libonig-dev \
#     libxml2-dev \
#     zip \
#     unzip
# 
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# 
# RUN docker-php-ext-install exif pcntl bcmath gd
# 
# WORKDIR /var/www

FROM php:8.1.5-fpm-alpine3.15

RUN apk --update --no-cache add git postgresql-dev
RUN apk add --no-cache $PHPIZE_DEPS
RUN pecl install xdebug 
RUN docker-php-ext-install pdo pdo_pgsql 
RUN docker-php-ext-enable xdebug

WORKDIR /var/www
EXPOSE 9000
