#!bin/bash


CATALINA_HOME=/opt/apache-tomcat-8.5.32

cp /container_config_folder/mysql-connector-java-8.0.11.jar $CATALINA_HOME/lib
cp -f /container_config_folder/server.xml $CATALINA_HOME/conf

$CATALINA_HOME/bin/startup.sh  &
