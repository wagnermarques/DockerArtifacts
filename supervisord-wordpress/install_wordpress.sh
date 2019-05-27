#!/bin/bash

cd www/html

if [ -d wordpress ];
then
    #if wordpress dir exists lets remove it
    rm -rf wordpress
fi

curl -o latest-pt_BR.zip https://br.wordpress.org/latest-pt_BR.zip
unzip -f latest-pt_BR.zip
rm -f latest-pt_BR.zip
cd ../../container_config_folder
mysql -u root -h 192.168.33.151 -padmin123 < config_database.sql

cp ../../container_config_folder/wp-config.php wordpress/
ls -l  wordpress


