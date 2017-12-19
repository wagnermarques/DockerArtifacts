FROM wagnermarques/java-oracle8-f27:0.0.1

#http://www.eclipse.org/sirius/download.html
#https://www.obeodesigner.com/en/download
#https://www.obeodesigner.com/en/download


MAINTAINER wagnerdocri@gmail.com

# Java Version and other

ENV EclipseUrlForDownload http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/oxygen/1a/eclipse-jee-oxygen-1a-linux-gtk.tar.gz
                         

RUN wget ${EclipseUrlForDownload} -O /tmp/eclipse.tar.gz -q
RUN echo 'Installing eclipse' 
RUN tar xvf /tmp/eclipse.tar.gz -C /opt
RUN rm /tmp/eclipse.tar.gz
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
