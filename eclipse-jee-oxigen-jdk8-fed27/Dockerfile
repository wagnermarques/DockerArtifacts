FROM wagnermarques/java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

# Java Version and other

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


RUN dnf -y update && dnf -y install firefox xorg-x11-twm tigervnc-server xterm xulrunner dejavu-sans-fonts dejavu-serif-fonts xdotool
RUN dnf clean

ENV EclipseUrlForDownload http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/oxygen/1a/eclipse-jee-oxygen-1a-linux-gtk.tar.gz
                         
RUN wget ${EclipseUrlForDownload} -O /tmp/eclipse.tar.gz -q
RUN echo 'Installing eclipse' 
RUN tar xvf /tmp/eclipse.tar.gz -C /opt
RUN rm /tmp/eclipse.tar.gz
RUN ls /opt

RUN ls /opt/eclipse -l



RUN chmod +x /opt/eclipse
#    mkdir -p /home/developer && \
#    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:1000:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
##    chown developer:developer -R /home/developer && \
#chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo




#INSTALLING SOME PLUGINS WITH P2
#https://help.eclipse.org/oxygen/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Fguide%2Fp2_director.html
#RUN cd /opt/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://dadacoalition.org/yedit -installIU org.dadacoalition.yedit.feature.group

#OpenInTerminal - Add option in context menu
#RUN cd /opt/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://eclipse-openinterminal.googlecode.com/svn/trunk/site/ -installIU OpenInTerminal.feature.group

#yedit - YAML Editor
#RUN cd /opt/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://dadacoalition.org/yedit -installIU org.dadacoalition.yedit.feature.group

#shelled - Bash Script Editor
#RUN cd /opt/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://download.eclipse.org/technology/dltk/updates/,https://sourceforge.net/projects/shelled/files/shelled/update/ -installIU net.sourceforge.shelled.feature.group

#Web Page Editor
#RUN cd /opt/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/ -installIU org.eclipse.jst.webpageeditor.feature.feature.group

#protobuf-dt - Google Protobuffer editor
#eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/indigo/,http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/,http://protobuf-dt.googlecode.com/git/update-site -installIU com.google.eclipse.protobuf.feature.group






# Define default command.
#CMD ["/opt/eclipse" "-clean -data /default_workspace"]
#CMD ["bash", "pwd"]

ENTRYPOINT ["/bin/ls", "/opt/eclipse"]


#REFS
#https://github.com/fgrehm/docker-eclipse/blob/master/Dockerfile
