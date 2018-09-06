FROM wagnermarques/java-oracle8-f27-vnc:0.0.1

MAINTAINER wagnerdocri@gmail.com

# Java Version and other

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


RUN dnf update -y  && \
    dnf install gtk3 unzip -y

ENV eclipseUrlForDownload http://mirror.nbtelecom.com.br/eclipse/technology/epp/downloads/release/photon/R/eclipse-reporting-photon-R-linux-gtk-x86_64.tar.gz

RUN wget -c $eclipseUrlForDownload -O /tmp/eclipse.tar.gz
RUN mv /tmp/eclipse.tar.gz /opt  && cd /opt && ls -l && tar xvzf eclipse.tar.gz && ls -l
RUN ls /opt/eclipse 
RUN chmod +x /opt/eclipse/eclipse


RUN mkdir -p /etc/sudoers.d/ && \
    mkdir -p /home/developer/.vnc && \
    > /root/.Xauthority

RUN ls -ilha /root/.Xauthority 

RUN mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer
    #echo developer123 | vncpasswd -f > /home/developer/.vnc/passwd
    #chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo



#INSTALLING SOME PLUGINS WITH P2
#https://help.eclipse.org/oxygen/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Fguide%2Fp2_director.html
#RUN cd /opt/eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director \
#                            -repository http://download.eclipse.org/releases/indigo/,http://dadacoalition.org/yedit
#                            -installIU org.dadacoalition.yedit.feature.group

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





RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /opt/eclipse/eclipse ] && /opt/eclipse/eclipse  &' /etc/X11/xinit/xinitrc

EXPOSE 5901
