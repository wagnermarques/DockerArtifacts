#!/bin/bash
SQL=$1
docker exec sqlserver /opt/mssql-tools/bin/sqlcmd $SQL
