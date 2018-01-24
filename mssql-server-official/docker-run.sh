#!/bin/bash
# https://docs.microsoft.com/pt-br/sql/linux/sql-server-linux-configure-environment-variables
# https://hub.docker.com/r/microsoft/mssql-server-linux/
docker run --name mmsql-server \
   -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=P@SSW0RD' \
   -e 'MSSQL_PID=Express' -p 1433:1433 \
   -d store/microsoft/mssql-server-linux:2017-latest
