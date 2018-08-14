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
RUN dnf -y install findutils git wget unzip zip  && dnf clean all

ADD /container_config_folder /container_config_folder 

#needed just if you are behind a proxy
RUN cp /container_config_folder/.wgetrc  ~/



#---------- All downloads firts to facilitate rebuild image
ENV tomcatDwldLink=http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.10/bin/apache-tomcat-9.0.10.tar.gz
ENV CATALINA_HOME=/opt/tomcat9

RUN wget --output-document /tomcat9.tar.gz  -e use_proxy=on -e http_proxy=$http_proxy -e https_proxy=$http_proxy $tomcatDwldLink
RUN wget --output-document /postgresql-42.2.4.jar https://jdbc.postgresql.org/download/postgresql-42.2.4.jar
RUN wget --output-document /orbeonforms.zip https://github.com/orbeon/orbeon-forms/releases/download/tag-release-2017.2-ce/orbeon-2017.2.201712300816-CE.zip



#---------- installing and configuring tomcat
RUN tar xf tomcat9.tar.gz &&  mv apache-tomcat-9.0.10 /opt/tomcat9
RUN chmod +x $CATALINA_HOME/bin/*.sh
ENV PATH=:$PATH:$CATALINA_HOME/bin



#---------- configuring tomcat9
RUN mv postgresql-42.2.4.jar $CATALINA_HOME/lib
RUN cp -f /container_config_folder/tomcat-manager-context.xml $CATALINA_HOME/webapps/manager/META-INF/context.xml
RUN cp -f /container_config_folder/tomcat-host-manager-context.xml $CATALINA_HOME/webapps/host-manager/META-INF/context.xml
RUN cp -f /container_config_folder/tomcat-server.xml  $CATALINA_HOME/conf/server.xml



#---------- downloa, configure and deploying orbeonforms
RUN unzip -qq orbeonforms.zip
RUN mkdir /orbeon && unzip -d /orbeon -qq orbeon-2017.2.201712300816-CE/orbeon.war
#https://doc.orbeon.com/configuration/advanced/xforms-logging
RUN cp -f /container_config_folder/orbeon-log4j.xml /orbeon/WEB-INF/resources/config/log4j.xml
#https://doc.orbeon.com/configuration/properties
RUN cp -f /container_config_folder/orbeon-properties-local.xml /orbeon/WEB-INF/resources/config/properties-local.xml

#deploying orbeon
RUN mv /orbeon $CATALINA_HOME/webapps


WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["/opt/tomcat9/bin/catalina.sh", "run"]

