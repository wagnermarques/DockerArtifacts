
FROM fedora:25
#
#based on: https://hub.docker.com/r/sonatype/docker-nexus3/~/dockerfile/
#

#dnf needs proxy config in this way, but wget, seams to me, do not use proxy in this way
#I have been uncommented it when I'm behind a proxy
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


RUN dnf clean all && dnf -y update &&  dnf -y upgrade                                                                              
#RUN dnf -y install tar  wget gzip unzip java java-devel && dnf clean all
RUN dnf -y install tar wget curl


#------
# Download and
# Installing java jdk
#------
ENV JDKFILE=jdk-8u121-linux-x64.tar.gz
            
ENV JAVA_HOME=/opt/jdk/jdk1.8.0_121

RUN mkdir -p /opt/jdk

#RUN wget use_proxy=yes -e http_proxy="http://wagner:nicolas1*@192.168.0.2:3128/" --output-document /opt/jdk/$JDKFILE --no-cookies --no-check-certificate --header "Cookie:s_nr=1484102101551; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDKFILE"
#RUN wget  --output-document /opt/jdk/$JDKFILE --no-cookies --no-check-certificate --header "Cookie:s_nr=1484102101551; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDKFILE"
#RUN wget --no-check-certificate -c --header "Cookie:
#oraclelicense=accept-secureb    ackup-cookie"
#"http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz"

# if wget is not behind a proxy its ignore proxy options
RUN wget --proxy=on --proxy-user "wagner" --proxy-password "nicolas1*" \
         --user=wagner --password=nicolas1* --output-document /opt/jdk/$JDKFILE \
         --no-cookies       \
         --no-check-certificate --header "Cookie:s_nr=148410210155; oraclelicense=accept-securebackup-cookie"  "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDKFILE"         

# "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDKFILE"         



RUN cd /opt/jdk && tar xvf $JDKFILE  && rm $JDKFILE

#FROM: https://gist.github.com/voor/b2dd473db296d9eae004
## OpenJDK started using 18000XX as their priority, so kick it up to 2 million to surpass them.
RUN alternatives --install /usr/bin/java   java     $JAVA_HOME/bin/java 2000000
RUN alternatives --install /usr/bin/javaws javaws   $JAVA_HOME/bin/javaws 2000000
RUN alternatives --install /usr/bin/javac  javac    $JAVA_HOME/bin/javac 2000000
RUN alternatives --install /usr/bin/jar    jar      $JAVA_HOME/bin/jar 2000000





#------
# Download and
# Installing maven
#------

ENV M2_HOME=/usr/share/maven
ENV MAVEN_VERSION 3.2.5
RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
&& mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
&& ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV PATH=${PATH}:$M2_HOME/bin
ADD settings.xml /usr/share/maven/conf/settings.xml


# when issue docker exec -it fzl_maven mvn archetype:generate
# the project will be created in /opt/container_mvn_projects
# to create the project out of container, please provide volume -v to override this place
RUN mkdir /container_mvn_projects



#------
# Download and
# Installing and runing nexus
# https://support.sonatype.com/hc/en-us/articles/218637467-Download-Nexus-Repository-Manager-3
# https://hub.docker.com/r/sonatype/nexus3/
# https://github.com/sonatype/docker-nexus/blob/master/oss/Dockerfile
#------

ENV NexusTarFileName=nexus-3.2.1-01-unix.tar.gz
ENV NexusDownloadLink=http://download.sonatype.com/nexus/3/$NexusTarFileName 
ENV NexusUncopressedDirName=nexus-3.2.1-01

ENV NEXUS_HOME=/opt/$NexusUncopressedDirName \
    NEXUS_DATA=/nexus-data \                    
    NEXUS_CONTEXT='' \
    SONATYPE_WORK=${SONATYPE_DIR}/sonatype-work


RUN curl -sSL  $NexusDownloadLink | tar xzf - -C /opt


# configure nexus
# from:https://hub.docker.com/r/sonatype/docker-nexus3/~/dockerfile/
RUN sed \
    -e "s|karaf.home=.|karaf.home=${NEXUS_HOME}|g" \
    -e "s|karaf.base=.|karaf.base=${NEXUS_HOME}|g" \
    -e "s|karaf.etc=etc|karaf.etc=${NEXUS_HOME}/etc|g" \
    -e "s|java.util.logging.config.file=etc|java.util.logging.config.file=${NEXUS_HOME}/etc|g" \
    -e "s|karaf.data=.*|karaf.data=${NEXUS_DATA}|g" \
    -e "s|java.io.tmpdir=.*|java.io.tmpdir=${NEXUS_DATA}/tmp|g" \
    -e "s|LogFile=.*|LogFile=${NEXUS_DATA}/log/jvm.log|g" \
    -i ${NEXUS_HOME}/bin/nexus.vmoptions \
  && sed \
    -e "s|nexus-context-path=/|nexus-context-path=/\${NEXUS_CONTEXT}|g" \
    -i ${NEXUS_HOME}/etc/nexus-default.properties \
  && mkdir -p ${NEXUS_DATA}/etc ${NEXUS_DATA}/log ${NEXUS_DATA}/tmp



RUN ln -s /opt/$NexusUncopressedDirName/bin/nexus /usr/bin/nexus


#from https://github.com/sonatype/docker-nexus3/blob/master/Dockerfile
RUN useradd -r -u 200 -m -c "nexus role account" -d ${NEXUS_DATA} -s /bin/false nexus \
  && mkdir -p ${NEXUS_DATA}/etc ${NEXUS_DATA}/log ${NEXUS_DATA}/tmp ${SONATYPE_WORK} \
  && ln -s ${NEXUS_DATA} ${SONATYPE_WORK}/nexus3 \
  && chown -R nexus:nexus ${NEXUS_DATA} \
  && chown -R nexus:nexus ${SONATYPE_WORK}

RUN usermod -a -G root nexus

WORKDIR ${NEXUS_HOME}

# Could be used for images based on this Docker image to specify default mirrored repository
#ENV mavenRepositoryUrl http://localhost:8081/nexus/content/groups/public/
#ADD settings.xml /usr/share/maven/conf/settings.xml

ADD scripts /scripts
RUN chmod +x /scripts/*.sh

ENV PATH=${PATH}:$JAVA_HOME/bin


#Running nexus
#USER nexus
EXPOSE 8081    

ENV JAVA_MAX_MEM=1200m \
    JAVA_MIN_MEM=1200m \
    EXTRA_JAVA_OPTS=""


CMD ["/usr/bin/nexus","run"]
