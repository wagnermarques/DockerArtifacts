FROM fedora:25

MAINTAINER wagnerdocri@gmail.com

# Java Version and other


##ENV JDK_RPM_FILE_NAME=
ENV JDKFILE=jdk-8u121-linux-x64.tar.gz
ENV JAVA_HOME=/opt/jdk/jdk1.8.0_121

#ENV JDK_FILENAME=jdk-8u121-linux-x64.tar.gz


#PATH=${PATH}:/opt/jdk/bin 

#RUN dnf -y update
RUN dnf -y install tar wget  && dnf clean all

RUN mkdir -p /opt/jdk
RUN wget --output-document /opt/jdk/$JDKFILE --no-cookies --no-check-certificate --header "Cookie:s_nr=1484102101551; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDKFILE" 
RUN cd /opt/jdk && tar xvf $JDKFILE 

#FROM: https://gist.github.com/voor/b2dd473db296d9eae004
## OpenJDK started using 18000XX as their priority, so kick it up to 2 million to surpass them.

RUN alternatives --install /usr/bin/java   java     $JAVA_HOME/bin/java 2000000
RUN alternatives --install /usr/bin/javaws javaws   $JAVA_HOME/bin/javaws 2000000
RUN alternatives --install /usr/bin/javac  javac    $JAVA_HOME/bin/javac 2000000
RUN alternatives --install /usr/bin/jar    jar      $JAVA_HOME/bin/jar 2000000


# Define default command.
CMD ["bash"]
