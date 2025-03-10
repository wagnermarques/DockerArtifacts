FROM php:7.4-apache

# Install required packages and PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    git \
    curl \
    wget \
    libicu-dev \
    libxslt1-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    gd \
    mysqli \
    pdo \
    pdo_mysql \
    xml \
    zip \
    intl \
    xsl

# Enable Apache modules
RUN a2enmod rewrite

# Set PHP configuration
RUN echo "memory_limit = 256M" > /usr/local/etc/php/conf.d/memory-limit.ini \
    && echo "upload_max_filesize = 50M" > /usr/local/etc/php/conf.d/upload-limit.ini \
    && echo "post_max_size = 50M" >> /usr/local/etc/php/conf.d/upload-limit.ini

# Set Apache document root
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Download and extract OJS
WORKDIR /var/www
RUN curl -L https://pkp.sfu.ca/ojs/download/ojs-3.3.0-11.tar.gz | tar xz \
    && mv ojs-3.3.0-11 html \
    && chown -R www-data:www-data html

# Copy configuration file
COPY config.inc.php /var/www/html/config.inc.php
RUN chown www-data:www-data /var/www/html/config.inc.php

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]