<<<<<<< HEAD
FROM wagnermarques/fzl_vnc:0.0.1
MAINTAINER wagnerdocri@gmail.com
=======
FROM docker.io/fedora
MAINTAINER http://fedoraproject.org/wiki/Cloud
>>>>>>> 959b18c844e96b14323f8bb4d528633385859333

# RUN label is for atomic cli, allows for ease of use
LABEL RUN='docker run -d -p 5901:5901 -v /etc/machine-id:/etc/machine-id:ro $IMAGE'

# Install the appropriate software
<<<<<<< HEAD
RUN dnf -y update
RUN dnf -y install firefox 
RUN dnf clean all
=======
RUN dnf -y update && \
    dnf -y install firefox \
                   xorg-x11-twm \
                   tigervnc-server \
                   xterm xulrunner \
                   dejavu-sans-fonts  \
                   dejavu-serif-fonts \
                   xdotool && \
    dnf clean all
>>>>>>> 959b18c844e96b14323f8bb4d528633385859333

RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /usr/bin/firefox ] && /usr/bin/firefox &' /etc/X11/xinit/xinitrc

EXPOSE 5901

CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
