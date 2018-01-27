#!/bin/bash
CONTAINER_NAME=sqlserver
IMG_NAME=microsoft/mssql-server-linux

docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<P@SSW0RD>' \
        --net fzl_network_bridge --ip 192.168.33.164 \
        -p 1401:1433 --name sqlserver \
        -v $(pwd)/sqlscripts:/sqlscripts \
        -d microsoft/mssql-server-linux 


       
