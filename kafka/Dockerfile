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

ADD ./scripts /scripts
ADD ./container_config_folder /container_config_folder

#needed just if you are behind a proxy
RUN cp /container_config_folder/.wgetrc  ~/



ENV KAFKA_DOWNLOAD_LINK=https://downloads.sourceforge.net/project/lportal/Liferay%20Portal/7.0.2%20GA3/liferay-ce-portal-tomcat-7.0-ga3-20160804222206210.zip?r=https%3A%2F%2Fwww.liferay.com%2Fdownloads&ts=1485642085&use_mirror=ufpr
ENV KAFKAFILE=liferay-ce-portal-tomcat-7.0-ga3-20160804222206210.zip
ENV KAFKA_HOME=/opt/liferay-ce-portal-7.0-ga3

#------
#Installing kafka
#------
#behind a proxy? use the first one command, otherwhise use second one
#RUN wget --output-document /opt/$KAFKAFILE -e use_proxy=$use_proxy -e http_proxy=$http_proxy -e https_proxy=$http_proxy $KAFKA_DOWNLOAD_LINK
RUN wget --output-document /opt/$KAFKAFILE $KAFKA_DOWNLOAD_LINK

RUN cd /opt && unzip $KAFKAFILE
RUN touch $KAFKA_HOME/tomcat-8.0.32/logs/catalina.out
RUN rm /opt/$KAFKAFILE
RUN cp /container_config_folder/portal-ext.properties /opt/liferay-ce-portal-7.0-ga3/


#------
#Deploying orbeon forms porlet
#I've been downloaded orbeon manually
#------
#RUN unzip -d /opt/ /container_config_folder/downloads/orbeon-2017.2.201712300816-CE.zip
#RUN ls -l /opt/orbeon-2017.2.201712300816-CE

# Define default command.
#CMD $KAFKA_HOME/tomcat-8.0.32/bin/startup.sh && tail -f $KAFKA_HOME/tomcat-8.0.32/logs/catalina.out
ENTRYPOINT ["/scripts/entrypoint.sh"]
