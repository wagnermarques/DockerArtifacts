#!/bin/bash
COMMAND_TO_RUN=$1

echo "[docker-exec.sh] running..."
echo "[docker-exec.sh] docker exec -it pgsql $COMMAND_TO_RUN"
docker exec -it pgsql $COMMAND_TO_RUN
