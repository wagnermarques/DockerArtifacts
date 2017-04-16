FROM fedora:25

MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


ENV JDKFILE=jdk-8u121-linux-x64.tar.gz
ENV JAVA_HOME=/opt/jdk/jdk1.8.0_121

ENV TOMCATFILE=apache-tomcat-8.5.13.tar.gz
ENV CATALINA_HOME=/opt/apache-tomcat-8.5.13
                      

ENV PATH=${PATH}:$JAVA_HOME/bin 



RUN dnf -y update
RUN dnf -y install tar wget unzip  && dnf clean all



RUN mkdir -p /opt/jdk


#------
# Download jdk and tomcat
#------

RUN wget --output-document /opt/jdk/$JDKFILE --no-cookies --no-check-certificate --header "Cookie:s_nr=1484102101551; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDKFILE"
RUN wget --output-document /opt/$TOMCATFILE "http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.5.13/bin/$TOMCATFILE"



#------
#Installing java jdk
#------
RUN cd /opt/jdk && tar xvf $JDKFILE  && rm $JDKFILE

#FROM: https://gist.github.com/voor/b2dd473db296d9eae004
## OpenJDK started using 18000XX as their priority, so kick it up to 2 million to surpass them.
RUN alternatives --install /usr/bin/java   java     $JAVA_HOME/bin/java 2000000
RUN alternatives --install /usr/bin/javaws javaws   $JAVA_HOME/bin/javaws 2000000
RUN alternatives --install /usr/bin/javac  javac    $JAVA_HOME/bin/javac 2000000
RUN alternatives --install /usr/bin/jar    jar      $JAVA_HOME/bin/jar 2000000



#------
#Installing and configuring tomcat8
#------
RUN cd /opt && tar -zxvf  $TOMCATFILE

#create catalina.out because at the very beginning of the start server state
#this file still does not existe but we issue tail -f against it to see the logs
RUN touch $CATALINA_HOME/logs/catalina.out

ADD conf $CATALINA_HOME/conf

# Define default command.
CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out
