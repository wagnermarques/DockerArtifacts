#!/bin/bash

echo "Using..."
echo  "APACHE_RUN_USER $APACHE_RUN_USER"
echo  "APACHE_RUN_GROUP $APACHE_RUN_GROUP"
echo  "APACHE_LOG_DIR $APACHE_LOG_DIR"


# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

echo "Versao do PHP:";
php -v

exec /usr/sbin/httpd -D FOREGROUND

