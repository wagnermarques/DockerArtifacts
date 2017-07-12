FROM wagnermarques/java-oracle8:0.0.1

MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/

ENV TOMCATFILE=apache-tomcat-7.0$CATALINA_HOME.56.tar.gz
ENV CATALINA_HOME=/opt/apache-tomcat-7.0.56
                      

ENV PATH=${PATH}:$JAVA_HOME/bin 

RUN dnf -y update
RUN dnf -y install tar wget unzip  && dnf clean all

#------
# Download (with wget) jdk and tomcat
#------
RUN wget --output-document /opt/$TOMCATFILE "https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.56/bin/$TOMCATFILE"

ADD /downloads/apache-tomcat-7.0.56 $CATALINA_HOME


#this file still does not existe but we issue tail -f against it to see the logs
RUN touch $CATALINA_HOME/logs/catalina.out

ADD conf $CATALINA_HOME/conf

ADD /webapps/manager/META-INF/ $CATALINA_HOME/webapps/manager/META-INF/

# Define default command.
CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out
