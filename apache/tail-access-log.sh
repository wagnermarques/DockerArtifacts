#!/bin/bash
docker exec -it fzl_apache tail -f /var/log/httpd/access_log
