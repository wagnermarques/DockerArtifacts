FROM fedora:27
MAINTAINER wagnerdocri@gmail.com

# Install the appropriate software
RUN dnf -y update
RUN dnf -y install xorg-x11-twm tigervnc-server xterm dejavu-sans-fonts dejavu-serif-fonts xdotool
RUN dnf clean all

# Add the xstartup file into the image and set the default password.
RUN mkdir /root/.vnc
ADD ./xstartup /root/.vnc/
RUN chmod -v +x /root/.vnc/xstartup
RUN echo admin123 | vncpasswd -f > /root/.vnc/passwd
RUN chmod -v 600 /root/.vnc/passwd

#this line will be used in extended containers, REPLATE X_APPLICATION_EXECUTABLE with approprieate app binary executable
RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /usr/bin/xterm ] && /usr/bin/xterm &' /etc/X11/xinit/xinitrc

#idem
EXPOSE 5901

CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
