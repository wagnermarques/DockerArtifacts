#!/bin/bash
set -e

# Replace environment variables in config.inc.php
envsubst < /var/www/html/config.inc.php > /var/www/html/config.inc.php.tmp
mv /var/www/html/config.inc.php.tmp /var/www/html/config.inc.php

# Wait for database to be ready
echo "Waiting for database connection..."
RETRIES=20
until mysql -h$OJS_DB_HOST -u$OJS_DB_USER -p$OJS_DB_PASSWORD -e "show databases;" &> /dev/null
do
  sleep 3
  echo "Waiting for database connection..."
  RETRIES=$((RETRIES - 1))
  if [ $RETRIES -eq 0 ]; then
    echo "Error: Could not connect to database. Exiting."
    exit 1
  fi
done
echo "Database connection established"

# Check if OJS is installed
if [[ ${OJS_CLI_INSTALL} == "1" && ! -f /var/www/html/config.inc.php.installed ]]; then
  echo "Running OJS installation..."
  php /var/www/html/tools/install.php \
    install \
    ${OJS_DB_USER} \
    ${OJS_DB_PASSWORD} \
    ${OJS_DB_NAME} \
    ${OJS_ADMIN_USERNAME} \
    ${OJS_ADMIN_PASSWORD} \
    ${OJS_ADMIN_EMAIL} \
    locale en_US

  # Mark as installed
  cp /var/www/html/config.inc.php /var/www/html/config.inc.php.installed
  sed -i "s/installed = Off/installed = On/" /var/www/html/config.inc.php
  
  echo "OJS installation completed"
else
  echo "OJS already installed or installation not requested"
fi

# Fix permissions
chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;

# Start Apache
exec "$@"