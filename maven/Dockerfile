
FROM fedora:25


RUN dnf -y update && dnf clean all
RUN dnf -y install tar  wget gzip unzip java java-devel && dnf clean all


ENV JDKFILE=jdk-8u121-linux-x64.tar.gz
ENV JAVA_HOME=/opt/jdk/jdk1.8.0_121
ENV MAVEN_VERSION 3.2.5
ENV M2_REPO=
ENV PATH=${PATH}:$JAVA_HOME/bin






#------
# Download and
# Installing java jdk
#------
RUN mkdir -p /opt/jdk

RUN wget --output-document /opt/jdk/$JDKFILE --no-cookies --no-check-certificate --header "Cookie:s_nr=1484102101551; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/$JDKFILE"

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
RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
&& mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
&& ln -s /usr/share/maven/bin/mvn /usr/bin/mvn





#------
# Download and
# Installing and runing nexus
# https://support.sonatype.com/hc/en-us/articles/218637467-Download-Nexus-Repository-Manager-3
# https://hub.docker.com/r/sonatype/nexus3/
# https://github.com/sonatype/docker-nexus/blob/master/oss/Dockerfile
#------
ENV NexusTarFileName=nexus-3.2.1-01-unix.tar.gz
ENV NexusUncopressedDirName=nexus-3.2.1-01
ENV NexusDownloadLink=http://download.sonatype.com/nexus/3/$NexusTarFileName 


RUN curl -sSL  $NexusDownloadLink | tar xzf - -C /opt
RUN ls /opt
RUN ln -s /opt/$NexusUncopressedDirName/bin/nexus /usr/bin/nexus


ENV NEXUS_HOME=/opt/$NexusUncopressedDirName \
    NEXUS_DATA=/nexus-data \                    
    NEXUS_CONTEXT='' \
    SONATYPE_WORK=${SONATYPE_DIR}/sonatype-work

#from https://github.com/sonatype/docker-nexus3/blob/master/Dockerfile
RUN useradd -r -u 200 -m -c "nexus role account" -d ${NEXUS_DATA} -s /bin/false nexus \
  && mkdir -p ${NEXUS_DATA}/etc ${NEXUS_DATA}/log ${NEXUS_DATA}/tmp ${SONATYPE_WORK} \
  && ln -s ${NEXUS_DATA} ${SONATYPE_WORK}/nexus3 \
  && chown -R nexus:nexus ${NEXUS_DATA} \
  && chown -R nexus:nexus ${SONATYPE_WORK}

RUN usermod -a -G root nexus
#USER nexus

EXPOSE 8081
WORKDIR ${NEXUS_HOME}

# Could be used for images based on this Docker image to specify default mirrored repository
#ENV mavenRepositoryUrl http://localhost:8081/nexus/content/groups/public/
#ADD settings.xml /usr/share/maven/conf/settings.xml

ENV M2_HOME /usr/share/maven

CMD ["/usr/bin/nexus","run"]


