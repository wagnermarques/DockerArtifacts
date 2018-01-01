FROM fedora:27
MAINTAINER wagnerdocri@gmail.com

# Install the appropriate software
RUN dnf -y update
RUN dnf -y install gcc xterm curl tigervnc-server openssh openssh-server
RUN dnf -y groupinstall "X Software Development"     
RUN dnf clean all

ENV fvwm3DownloadUrl=https://github.com/fvwmorg/fvwm/releases/download/2.6.7/fvwm-2.6.7.tar.gz
ENV fvwmUntaredDirName=fvwm-2.6.7
ENV fvwmTarballFileName=fvwm.tar.gz

RUN curl -SL --silent $fvwm3DownloadUrl --output /tmp/$fvwmTarballFileName

RUN cd /tmp
RUN tar xvf /tmp/$fvwmTarballFileName -C /opt
RUN cd /opt/$fvwmUntaredDirName && ./configure && make

# sometimes (I still do no know why)
# I face this message: xauth:  file /root/.Xauthority does not exist
RUN > /root/.Xauthority

# Add the xstartup file into the image and set the default password.

RUN mkdir /root/.vnc
ADD ./xstartup /root/.vnc/
RUN chmod -v +x /root/.vnc/xstartup
RUN echo admin123 | vncpasswd -f > /root/.vnc/passwd
RUN chmod -v 600 /root/.vnc/passwd

#this line will be used in extended containers, REPLATE X_APPLICATION_EXECUTABLE with approprieate app binary executable
RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /usr/bin/xterm ] && /usr/bin/xterm &' /etc/X11/xinit/xinitrc

#idem
EXPOSE 22 5901

CMD    ["vncserver", "-fg" ]
