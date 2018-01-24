#!/bin/bash
set -e
echo LIFERAY_HOME: $LIFERAY_HOME
$LIFERAY_HOME/tomcat-8.0.32/bin/startup.sh && tail -f $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out


