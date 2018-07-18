#!bin/bash


CATALINA_HOME=/opt/apache-tomcat-8.5.32

cp /container_config_folder/mysql-connector-java-8.0.11.jar $CATALINA_HOME/lib
cp /postgresql-42.2.4.jar $CATALINA_HOME/lib

cp -f /container_config_folder/server.xml $CATALINA_HOME/conf
ls $CATALINA_HOME/lib
$CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out

