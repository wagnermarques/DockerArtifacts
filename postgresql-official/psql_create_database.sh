#!/bin/bash
DB_NAME=$1
./docker-exec-in-a-specific-container.sh pgsql "CREATE DATABASE $DB_NAME;"
