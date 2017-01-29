FROM fedora:25

MAINTAINER wagnerdocri@gmail.com


ENV JDKFILE=jdk-8u121-linux-x64.tar.gz
ENV JAVA_HOME=/opt/jdk/jdk1.8.0_121

ENV LIFERAYFILE=liferay-ce-portal-tomcat-7.0-ga3-20160804222206210.zip
ENV LIFERAY_HOME=/opt/liferay-ce-portal-7.0-ga3
                      

ENV PATH=${PATH}:$JAVA_HOME/bin 



RUN dnf -y update
RUN dnf -y install tar wget unzip  && dnf clean all



RUN mkdir -p /opt/jdk

RUN wget --output-document /opt/jdk/$JDKFILE --no-cookies --no-check-certificate --header "Cookie:s_nr=1484102101551; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDKFILE"
RUN wget --output-document /opt/$LIFERAYFILE "https://downloads.sourceforge.net/project/lportal/Liferay%20Portal/7.0.2%20GA3/liferay-ce-portal-tomcat-7.0-ga3-20160804222206210.zip?r=https%3A%2F%2Fwww.liferay.com%2Fdownloads&ts=1485642085&use_mirror=ufpr"



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
#Installing liferay
#------
RUN cd /opt && unzip $LIFERAYFILE

RUN touch $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out


# Define default command.
CMD $LIFERAY_HOME/tomcat-8.0.32/bin/startup.sh && tail -f $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out
