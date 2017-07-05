
#Put '"' in this path makes curl unhappy
#Be carefull with spaces, so
#WAR_FILE=/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri\@gmail.com2/envs/env-dev/mvnprojects/fzlbpms-artifacts/maven-artifacts/fzl_web_primefaces/target/fzl_web_primefaces-1.0-SNAPSHOT.war

WAR_FILE=/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev-samples/primefaces/showcase-6.0.war



WEB_APP_CONTEXT="fzl_web_primefaces";

DEPLOY_URL="http://admin:admin123@localhost:8091/manager/text/deploy?path=/$WEB_APP_CONTEXT&update=true"
UN_DEPLOY_URL="http://admin:admin123@localhost:8091/manager/text/undeploy?path=/$WEB_APP_CONTEXT"


#curl  $UN_DEPLOY_URL
curl --upload-file $WAR_FILE $DEPLOY_URL

firefox http://localhost:8091/$WEB_APP_CONTEXT

docker exec -it fzl_tomcat8  tail -f /opt/apache-tomcat-8.5.14/logs/catalina.out
