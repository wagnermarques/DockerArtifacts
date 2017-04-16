#!/bin/bash
docker exec -it fzl_tomcat8  tail -f /opt/apache-tomcat-8.5.13/logs/catalina.out
