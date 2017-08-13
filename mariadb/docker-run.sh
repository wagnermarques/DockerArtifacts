#!/bin/bash

CONTAINER_NAME=fzl_mariadb;

DATA_DIR=/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/fzlbpms/fzlServer/data/data-mariadb/
LOG_DIR=/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/fzlbpms/fzlServer/log/log-mariadb/

docker rm fzl_mariadb
docker run  \
       --name fzl_mariadb -d  \
       --net fzl_network_bridge --ip 192.168.33.151  \
       -h fzl_mariadb  \
       -v $DATA_DIR:/var/lib/mysql \
       -v LOG_DIR:/var/log/mysql \
       -p 3306:3306  \
       wagnermarques/fzl_mariadb:0.0.1

       docker logs $CONTAINER_NAME
       
       #-v $NEXUS_DATA_DIR:/opt/sonatype-work \
       #      mvn -version
       #      /usr/bin/java -version
       
       


       

