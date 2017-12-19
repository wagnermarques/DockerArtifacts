FROM wagnermarques/fzl_vnc:0.0.1
MAINTAINER wagnerdocri@gmail.com

# Install the appropriate software
RUN dnf -y update
RUN dnf -y install firefox 
RUN dnf clean all

RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /usr/bin/firefox ] && /usr/bin/firefox &' /etc/X11/xinit/xinitrc

EXPOSE 5901

CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
