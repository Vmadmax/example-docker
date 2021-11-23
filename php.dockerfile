FROM php:8.0-fpm

RUN apt-get update
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y mariadb-client
RUN apt-get install -y libmagickwand-dev --no-install-recommends
RUN apt-get install -y ghostscript
RUN apt-get install -y imagemagick
RUN apt-get install -y locales
RUN apt-get install -y rsync
RUN pecl install imagick
RUN docker-php-ext-install gd
RUN docker-php-ext-enable imagick
RUN docker-php-ext-install pdo_mysql
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN apt-get install -y git
RUN apt-get update && apt-get install -y zlib1g-dev libzip-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install pcntl
