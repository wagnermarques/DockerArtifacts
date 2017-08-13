FROM wagnermarques/fzl_firefox:0.0.1
MAINTAINER wagnerdocri@gmail.com

# Install the appropriate software
RUN dnf -y update
RUN dnf -y install emacs 
RUN dnf clean all
EXPOSE 5901

RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /usr/bin/emacs ] && /usr/bin/emacs &' /etc/X11/xinit/xinitrc

CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
