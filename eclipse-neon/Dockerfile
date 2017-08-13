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



ENV EclipseUrlForDownload http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/3/eclipse-modeling-neon-3-linux-gtk-x86_64.tar.gz&mirror_id=576

RUN wget ${EclipseUrlForDownload} -O /tmp/eclipse.tar.gz -q && \
    echo 'Installing eclipse' && \
    ls -ilha /tmp/  
#    tar -xfz /tmp/eclipse.tar.gz -C /opt && \
#    rm /tmp/eclipse.tar.gz




RUN ls /opt

#eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://dadacoalition.org/yedit -installIU org.dadacoalition.yedit.feature.group
#OpenInTerminal - Add option in context menu
#eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://eclipse-openinterminal.googlecode.com/svn/trunk/site/ -installIU OpenInTerminal.feature.group
#protobuf-dt - Google Protobuffer editor
#eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/,http://protobuf-dt.googlecode.com/git/update-site -installIU com.google.eclipse.protobuf.feature.group
#yedit - YAML Editor
#eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://dadacoalition.org/yedit -installIU org.dadacoalition.yedit.feature.group
#shelled - Bash Script Editor
#eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://download.eclipse.org/technology/dltk/updates/,https://sourceforge.net/projects/shelled/files/shelled/update/ -installIU net.sourceforge.shelled.feature.group
#Web Page Editor
#eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/ -installIU org.eclipse.jst.webpageeditor.feature.feature.group



#RUN chmod +x /usr/local/bin/eclipse && \
#    mkdir -p /home/developer && \
#    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:1000:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
##    chown developer:developer -R /home/developer && \
#chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo



# Define default command.
CMD ["bash"]


#REFS
#https://github.com/fgrehm/docker-eclipse/blob/master/Dockerfile
