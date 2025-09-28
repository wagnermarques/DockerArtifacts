FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Install required packages
RUN apt-get update \
    && apt-get install -y \
        apache2 \
        curl \
        git \
        libapache2-mod-php \
        php \
        php-cli \
        php-curl \
        php-gd \
        php-intl \
        php-mbstring \
        php-mysql \
        php-xmlrpc \
        unzip \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up Moodle directories
RUN mkdir /var/www/html/moodle \
    && mkdir /var/moodledata \
    && chown -R www-data:www-data /var/www/html/moodle \
    && chown -R www-data:www-data /var/moodledata \
    && chmod 770 /var/www/html/moodle \
    && chmod 770 /var/moodledata

# Download and extract Moodle
WORKDIR /var/www/html/moodle
RUN wget -q https://download.moodle.org/stable4/moodle-latest-4.tgz \
    && tar -xf moodle-latest-4.tgz \
    && rm moodle-latest-4.tgz \
    && mv moodle/* . \
    && rmdir moodle


# Set Apache configuration
COPY moodle.conf /etc/apache2/sites-available/
RUN a2dissite 000-default.conf \
    && a2ensite moodle.conf \
    && a2enmod rewrite

# Expose ports
EXPOSE 8080

# Set the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
