#!/bin/bash

echo "running postgresql server..."
locale

#not using PGDATA name because we are setting data dir in postgresql.conf
PGDATA_DIRECTORY=/container_shared_folder/var/lib/pgsql/data/



#chown -R "$(id -u)" /container_shared_folder/  || chmod 700 /container_shared_folder/
#chown -R "$(id -u)" "$PGDATA_DIRECTORY"  || chmod 700 "$PGDATA_DIRECTORY"



#https://www.postgresql.org/docs/9.6/static/app-initdb.html
#https://social.technet.microsoft.com/wiki/pt-br/contents/articles/12733.postgresql-criar-banco-de-dados-com-a-codificacao-win1252-no-postgresql-usando-o-linux.aspx
#http://blog.infolink.com.br/criando-database-com-diferentes-encoding-em-banco-de-dados-postgresql/
#http://www.postgresql-archive.org/Como-configurar-o-PostgreSQL-8-3-para-pt-BR-td2038141.html
#https://www.postgresql.org/message-id/CAO5arLORB1K194pyfk3mOJ+Uh4Y56JsV62kWPOm+PZ+Csunyzw@mail.gmail.com
initdb --pgdata=$PGDATA_DIRECTORY --encoding=utf8 \
       --auth="trust" \
       --auth-host="trust" \
       --auth-local="trust" \
       --username='postgres'       \
       --pgdata="$PGDATA_DIRECTORY" \
       --pwfile="$PGDATA_DIRECTORY/pwfile" \
       --xlogdir="$PGDATA_DIRECTORY/transaction_log"

#       --locale="LATIN2" \
#       --lc-monetary='pt_BR.UTF-8' \
#       --lc-time='pt_BR.UTF-8'     \




       pg_ctl -D  $PGDATA_DIRECTORY/ 
       psql --version


       #       --locale="pt_BR.utf8" -> initdb: invalid locale name "pt_BR.utf8"









