#!/bin/bash

DB=$1
SCRIPT_SQL=$2

if [ "x$SCRIPT_SQL" = "x" ]; then
    {
        echo "USAGE: ./docker-exec-sql-script <dbname> <script_path>";
        docker exec -it mariadb sh -c "mysql -uroot -padmin123 < /sqlscripts/select_mysql_users.sql"
    }
    exit 1
fi

echo DB: $DB
echo SCRIPT_SQL:$SCRIPT_SQL


docker exec -it mariadb sh -c "mysql -uadmin -padmin123 $DB < $SCRIPT_SQL"

