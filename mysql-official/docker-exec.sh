#!/bin/bash

docker exec -it mariadb sh -c "mysql -uroot -padmin123 --execute='$1'"
