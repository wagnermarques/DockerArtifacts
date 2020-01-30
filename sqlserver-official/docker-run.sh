#!/bin/bash
CONTAINER_NAME=sqlserver
IMG_NAME=microsoft/mssql-server-linux
HOST_VOL_DIR=$(pwd)/../../somewritings/Etec-TLBD2/sql_scripts

echo '----------------------------------------------------'
echo Running sqlserver container
echo files in /sqlscripts
ls -l $HOST_VOL_DIR
echo '----------------------------------------------------'

docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=Aluno#123' \
        --net fzl_network_bridge --ip 192.168.33.164 \
        -p 1401:1433 --name sqlserver \
        -v $HOST_VOL_DIR:/sqlscripts \
        -d microsoft/mssql-server-linux 


       
