FROM wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

#if behind a proxy just uncomment this lines
#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV use_proxy=yes


RUN dnf -y update
RUN dnf -y install git wget unzip  && dnf clean all

ADD /container_config_folder /container_config_folder 

#needed just if you are behind a proxy
RUN cp /container_config_folder/.wgetrc  ~/

ENV TOMCATFILE=apache-tomcat-8.5.32.tar.gz
ENV tomcat8DwnLink=http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz

ENV CATALINA_HOME=/opt/apache-tomcat-8.5.32

RUN wget --output-document /opt/$TOMCATFILE  -e use_proxy=on -e http_proxy=$http_proxy -e https_proxy=$http_proxy $tomcat8DwnLink
                                   
#------
#Installing and configuring tomcat8
#------
RUN cd /opt && tar -zxvf  $TOMCATFILE

#create catalina.out because at the very beginning of the start server state
#this file still does not existis but we issue tail -f against it to see the logs
RUN > $CATALINA_HOME/logs/catalina.out

ADD /webapps/manager/META-INF/ $CATALINA_HOME/webapps/manager/META-INF/


RUN cd /opt
RUN wget https://github.com/orbeon/orbeon-forms/releases/download/tag-release-2017.2-ce/orbeon-2017.2.201712300816-CE.zip
RUN ls -la
RUN unzip -d /opt/ orbeon-2017.2.201712300816-CE.zip

RUN  cp /opt/orbeon-2017.2.201712300816-CE/orbeon.war $CATALINA_HOME/webapps

RUN wget https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-8.0.11.zip
RUN unzip mysql-connector-java-8.0.11.zip  
RUN mv mysql-connector-java-8.0.11/mysql-connector-java-8.0.11.jar /container_config_folder
RUN rm -rf mysql-connector-java-8.0.11
RUN rm mysql-connector-java-8.0.11.zip

RUN cd $CATALINA_HOME/webapps && unzip -d orbeon $CATALINA_HOME/webapps/orbeon.war

ADD /scripts /scripts
RUN chmod 777 /scripts
RUN chmod +x /scripts/*.sh
RUN rm orbeon-2017.2.201712300816-CE.zip


# Define default command.
# Define default command.
#CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out
ENTRYPOINT ["/scripts/entrypoint.sh"]


