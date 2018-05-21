#!/bin/bash
set -e
$KAFKA_HOME/bin/zookeeper-server-start.sh startup.sh $KAFKA_HOME/config/zookeeper.properties 
$KAFKA_HOME/bin/kafka-server-start.sh startup.sh $KAFKA_HOME/config/server.properties 
source create_topics.sh

