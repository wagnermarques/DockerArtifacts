FROM fedora

MAINTAINER wagnerdocri@gmail.com


#if you are not behind a proxy, comments this out                                                                                                                               
ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/              
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicoals1*@192.168.0.2:3128/                                                                                                                        
                                                                                                                                                         
RUN echo "proxy=http://192.168.0.2:3128/" >> /etc/dnf/dnf.conf
RUN echo "proxy_username=wagner" >> /etc/dnf/dnf.conf                                                                             
RUN echo "proxy_password=nicolas1*" >> /etc/dnf/dnf.conf                                                                                                                        

ADD /Downloads /Downloads
RUN ls /Downloads


# Java Version and other

##ENV JDK_RPM_FILE_NAME=
ENV JDKFILE=jdk-8u131-linux-x64.tar.gz
ENV JAVA_HOME=/opt/jdk/jdk1.8.0_131

#PATH=${PATH}:/opt/jdk/bin 

RUN dnf -y update
RUN dnf -y install tar wget  && dnf clean all

RUN mkdir -p /opt/jdk

RUN cd /opt/jdk && tar xvf $JDKFILE 

#FROM: https://gist.github.com/voor/b2dd473db296d9eae004
## OpenJDK started using 18000XX as their priority, so kick it up to 2 million to surpass them.
RUN alternatives --install /usr/bin/java   java     $JAVA_HOME/bin/java 2000000
RUN alternatives --install /usr/bin/javaws javaws   $JAVA_HOME/bin/javaws 2000000
RUN alternatives --install /usr/bin/javac  javac    $JAVA_HOME/bin/javac 2000000
RUN alternatives --install /usr/bin/jar    jar      $JAVA_HOME/bin/jar 2000000
