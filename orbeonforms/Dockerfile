FROM wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

#if behind a proxy just uncomment this lines
#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV use_proxy=yes


RUN dnf -y update
RUN dnf -y install findutils git wget unzip zip  && dnf clean all

ADD /container_config_folder /container_config_folder 
ADD /downloads /downloads

#needed just if you are behind a proxy
#RUN cp /container_config_folder/.wgetrc  ~/



#---------- All downloads firts to facilitate rebuild image
#ENV tomcat8DwnLink=http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz
ENV CATALINA_HOME=/opt/apache-tomcat-8.5.32

#so much buindings makes tomcat servers blocks downloads
#so, unsing manuallu downloads in /donwloads dir
#RUN wget --output-document /tomcat.tar.gz  -e use_proxy=on -e http_proxy=$http_proxy -e https_proxy=$http_proxy $tomcat8DwnLink
#RUN wget --output-document /postgresql-42.2.4.jar https://jdbc.postgresql.org/download/postgresql-42.2.4.jar
#RUN wget --output-document /orbeonforms.zip https://github.com/orbeon/orbeon-forms/releases/download/tag-release-2017.2-ce/orbeon-2017.2.201712300816-CE.zip
#RUN wget --output-document /mysql-connector-java-8.0.11.zip https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-8.0.11.zip




#---------- installing and configuring tomcat
RUN unzip -qq /downloads/apache-tomcat-8.5.32.zip
RUN mv /apache-tomcat-8.5.32 /opt
RUN mv /downloads/postgresql-42.2.4.jar $CATALINA_HOME/lib
RUN cp -f /container_config_folder/tomcat-manager-context.xml $CATALINA_HOME/webapps/manager/META-INF/context.xml
RUN cp -f /container_config_folder/tomcat-host-manager-context.xml $CATALINA_HOME/webapps/host-manager/META-INF/context.xml
RUN cp -f /container_config_folder/tomcat-server.xml  $CATALINA_HOME/conf/server.xml


#------
#Download and installing existdb
#to configure orbeon to work whith relational database
#The download was made manually in /downloads dir
#------
#RUN mkdir /exist
#RUN cd /exist &&  unzip -qq -o /downloads/exist-4.3.0.war
#RUN cp -f /container_config_folder/exist-conf.xml /exist/WEB-INF/conf.xml
#RUN mv /exist $CATALINA_HOME/webapps/
 



#----------Download and Installing orbeonforms in tomcat8
#RUN unzip  -qq orbeonforms.zip
RUN mkdir /orbeon 
RUN cd /orbeon &&  unzip -qq /downloads/orbeon-2017.2.201712300816-CE/orbeon.war
RUN cp  /downloads/orbeon-2017.2.201712300816-CE/orbeon.war $CATALINA_HOME/webapps


#RUN cp /orbeon-2017.2.201712300816-CE/orbeon.war $CATALINA_HOME/webapps
#explode orbeon apps for further configurations
#ENV ORBEON_WEBAPP_ROOTDIR=/orbeon/WEB-INF/resources
#ENV ORBEON_LIBDIR=/orbeon/WEB-INF/lib

#RUN mv /orbeon/WEB-INF/lib/orbeon-form-runner.jar /
#RUN mv /orbeon/WEB-INF/lib/orbeon-form-builder.jar /

#RUN mkdir /orbeon-form-runner
#RUN cd /orbeon-form-runner && unzip /orbeon-form-runner.jar
#RUN rm orbeon-form-runner.jar
#RUN cp -r /orbeon-form-runner $ORBEON_WEBAPP_ROOTDIR
#RUN zip -r /orbeon-form-runner.jar /orbeon-form-runner/

#RUN mkdir /orbeon-form-builder
#RUN cd /orbeon-form-builder && unzip /orbeon-form-builder.jar
#RUN rm orbeon-form-builder.jar
#RUN cp -r /orbeon-form-builder $ORBEON_WEBAPP_ROOTDIR
#RUN zip -r /orbeon-form-builder.jar /orbeon-form-builder/

#RUN mv /orbeon-form-builder.jar   $ORBEON_LIBDIR
#RUN mv /orbeon-form-runner.jar  $ORBEON_LIBDIR

#RUN ls -l $ORBEON_WEBAPP_ROOTDIR


#RUN mv /orbeon $CATALINA_HOME/webapps

RUN mkdir -p /orbeon/META-INF
#RUN cp -f /container_config_folder/orbeon-log4j.xml /orbeon/META-INF/log4j.xml
#RUN cp -f /container_config_folder/orbeon-context.xml /orbeon/META-INF/context.xml
#RUN cp -f /container_config_folder/orbeon-web.xml /orbeon/WEB-INF/web.xml
#RUN cp -f /container_config_folder/orbeon-properties-local.xml /orbeon/WEB-INF/resources/config/properties-local.xml


RUN cp -r /orbeon $CATALINA_HOME/webapps
RUN cp /container_config_folder/testdatasource.war $CATALINA_HOME/webapps



#----------i18n orbeon-form-runner.jar for pt-BR
#RUN unzip /downloads/orbeon/WEB-INF/lib/orbeon-form-builder.jar
#RUN unzip /downloads/orbeon/WEB-INF/lib/orbeon-form-runner.jar
#RUN ls /downloads/orbeon/WEB-INF/lib/orbeon-form-builder/apps/fr/i18n
#RUN ls /downloads/orbeon/WEB-INF/lib/orbeon-form-runner/apps/fr/i18n

 

#----------Configure orbeon with properties-local.xml,  web.xml, log4j.xml and i18n
#RUN cp -f /container_config_folder/web.xml /downloads/orbeon/WEB-INF/
#RUN cp -f /container_config_folder/log4j.xml /downloads/orbeon/WEB-INF/resources/config/
#RUN cp -f /container_config_folder/orbeon-i18n-resources.xml /downloads/orbeon-form-runner/apps/fr/i18n/resources.xml
#RUN zip -r /downloads/orbeon-form-runner.jar /downloads/orbeon-form-runner/
#RUN cp -f /downloads/orbeon-form-runner.jar /downloads/orbeon/WEB-INF/lib


#----------Customize orbeon home page
#RUN cp -f /container_config_folder/orbeon-WEB-INF/resources/apps/home/examples-form-runner.xml /downloads/orbeon/WEB-INF/resources/apps/home/examples-form-runner.xml


#----------Deployin orbeon
#RUN cp -r /downloads/orbeon $CATALINA_HOME/webapps




#------
#Download jdbc connectors for mysql and postgresql
#to configure orbeon to work whith relational database
#------

#RUN unzip -d /downloads /downloads/mysql-connector-java-8.0.11.zip  
#RUN mv /downloads/mysql-connector-java-8.0.11/mysql-connector-java-8.0.11.jar  $CATALINA_HOME/lib



#RUN cp -f /downloads/postgresql-42.2.4.jar $CATALINA_HOME/lib







# Define default command.
#CMD $LIFERAY_HOME/tomcat-8.0.32/bin/startup.sh && tail -f $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out
ENV PATH=:$PATH:$CATALINA_HOME/bin
RUN chmod +x $CATALINA_HOME/bin/*.sh
WORKDIR $CATALINA_HOME

EXPOSE 8080
CMD ["/opt/apache-tomcat-8.5.32/bin/catalina.sh", "run"]

