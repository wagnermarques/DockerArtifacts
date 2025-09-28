FROM php:8.3-apache-bookworm

ARG TZ=America/Sao_Paulo
ENV PHP_INI_DIR=/usr/local/etc/php

# Install necessary packages for timezone management
RUN apt-get update && apt-get install -y \
    tzdata \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata    


# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libcurl4-openssl-dev \
    libzip4 \
    libzip-dev \
    libsodium-dev

RUN apt-get install -y locales && \
    echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen pt_BR.UTF-8 && \
    update-locale LANG=pt_BR.UTF-8    

RUN apt-get install iputils-ping nmap findutils vim coreutils -y

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN locale-gen pt_BR.UTF-8 && \
    update-locale LANG=pt_BR.UTF-8

ENV LANG=pt_BR.UTF-8 \
    LC_ALL=pt_BR.UTF-8 \
    LANGUAGE=pt_BR.UTF-8

# Install PHP extensions
#RUN docker-php-ext-install exif iconv mbstring curl tokenizer xmlrpc soap mysqli pdo pdo_mysql zip gd ctype simplexml xml dom intl json opcache sodium

RUN curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o - | sh -s \
    exif iconv mbstring curl tokenizer xmlrpc soap mysqli pdo pdo_mysql zip gd ctype simplexml xml dom intl json opcache sodium xdebug

RUN docker-php-ext-enable xdebug

# php.ini pra configurar memory limit
#algumas configuracoes sobre erros estao comentadas no php.ini-production e setadas no error_reporting.ini
COPY php.ini-development $PHP_INI_DIR/php.ini 
#COPY ./90-xdebug.ini "${PHP_INI_DIR}/conf.d"  

# Ensure PHP is configured to use the correct timezone
RUN echo "date.timezone=${TZ}" > ${PHP_INI_DIR}/conf.d/timezone.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY ./apache2.conf /etc/apache2/apache2.conf

#RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

RUN rm -f /var/log/apache2/error.log && rm -f /var/log/apache2/access.log

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2enmod rewrite && \
    service apache2 restart

# Set working directory
WORKDIR /var/www/html
