FROM fedora:27
#Based on https://github.com/jumanjiman/docker-xrdp/blob/master/fedora/Dockerfile
MAINTAINER wagnerdocri@gmail.com

ENV defaultUserName=usuarioPadrao
ENV defaultUserPassword=Usuariopadrao123*

# Install the appropriate software
RUN dnf -y update

#https://bluehatrecord.wordpress.com/2015/10/06/the-hidden-dnf-groups-of-the-fedora-repositories/
RUN dnf -y group install 'base-x'
RUN dnf -y install xorg-x11-fonts* icewm tigervnc-server

#RUN dnf -y install 
#RUN dnf -y install  xterm \
#           dejavu-sans-fonts dejavu-serif-fonts openssh  \
#           openssh-server  supervisor xrdp && dnf -y clean all

RUN dnf -y groupinstall 'Xfce Desktop'
RUN dnf -y clean all

#    dnf -y install \
#    supervisor \
#    xrdp \
#    && dnf clean all

#RUN useradd $defaultUserName && echo  $defaultUserName:$defaultUserPassword | chpasswd

#COPY etc/ /etc/

#RUN sed -i '/TerminalServerUsers/d' /etc/xrdp/sesman.ini && \
#    sed -i '/TerminalServerAdmins/d' /etc/xrdp/sesman.ini


RUN touch /root/.Xauthority 

# Add the xstartup file into the image and set the default password.
RUN mkdir /root/.vnc
ADD ./xstartup /root/.vnc/
RUN chmod -v +x /root/.vnc/xstartup
RUN echo admin123 | vncpasswd -f > /root/.vnc/passwd
RUN chmod -v 600 /root/.vnc/passwd

#this line will be used in extended containers, REPLATE X_APPLICATION_EXECUTABLE with approprieate app binary executable
RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /usr/bin/icewm-session ] && /usr/bin/icewm-session &' /etc/X11/xinit/xinitrc

#idem
EXPOSE 22 5901 3389 9001

#CMD ["supervisord", "-n"]
#CMD    ["vncserver", "-fg" ]
#ENTRYPOINT ["vncserver", "-fg" ]
CMD startx


