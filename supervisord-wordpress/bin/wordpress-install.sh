#!/bin/bash

thisFileDir=$(pwd)

cd ../www/html

if [ -d wordpress ];
then
    #if wordpress dir exists lets remove it
    rm -rf wordpress
fi

curl -o latest-pt_BR.zip https://br.wordpress.org/latest-pt_BR.zip
unzip -f latest-pt_BR.zip
rm -f latest-pt_BR.zip

cd $thisFileDir
docker exec -it wordpress_mariadb mysql -u root -padmin123 < config_database.sql


#cp ../../container_config_folder/wp-config.php wordpress/
#ls -l  wordpress


