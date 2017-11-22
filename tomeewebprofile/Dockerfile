FROM wagnermarques/java-oracle8:0.0.1

MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


ENV TOMCATFILE=apache-tomee-7.0.2-webprofile.tar.gz
ENV CATALINA_HOME=/opt/apache-tomee-7.0.2-webprofile
                      

RUN dnf -y update
RUN dnf -y install tar wget unzip  && dnf clean all


RUN wget --output-document /opt/$TOMCATFILE "http://repo.maven.apache.org/maven2/org/apache/tomee/apache-tomee/7.0.2/$TOMCATFILE"


#------
#Installing and configuring tomcat8
#------
RUN cd /opt && tar -zxvf  $TOMCATFILE

#create catalina.out because at the very beginning of the start server state
#this file still does not existe but we issue tail -f against it to see the logs
RUN touch $CATALINA_HOME/logs/catalina.out

ADD conf $CATALINA_HOME/conf

ADD /webapps/manager/META-INF/ $CATALINA_HOME/webapps/manager/META-INF/

# Define default command.
CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out
