#!/bin/bash
echo "$$$######################################################"
echo "$$$######################################################"
MARIADB_HOST=192.168.33.151
MARIADB_USER=root
MARIADB_PASS=admin123
mysql -h $MYSQL_HOST -u $MARIADB_USER -p $MARIADB_PASS mysql < /scripts/config_database.sql
echo "######################################################"
