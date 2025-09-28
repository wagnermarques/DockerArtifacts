#!/bin/bash
docker exec mariadb sh -c 'exec mysqldump --all-databases -uroot -p"admin123"' > $(pwd)/backups/all-databases.sql
