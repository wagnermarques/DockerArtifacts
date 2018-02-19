FROM docker.io/fedora:27

MAINTAINER wagnerdocri@gmail.com


#if behind a proxy just uncomment this lines
#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV use_proxy=yes



# Install the appropriate software
RUN dnf -y update  && \
    dnf -y install xorg-x11-twm \
                   tigervnc-server \
                   xterm \
                   dejavu-sans-fonts  \
                   dejavu-serif-fonts \
                   xdotool && \
    dnf clean all

# container_shared_folder will be mounted in docker run command
# the goal of this folder is for interchange with the container and maintain its contents in sync with the container
RUN mkdir -p /container_shared_folder
RUN chmod 777 -R /container_shared_folder #fix this

# the goal of this script folder is to prove container scripts
ADD ./scripts /scripts

RUN chmod +x /scripts/*.sh

# Add the xstartup file into the image and set the default password.
RUN mkdir /root/.vnc
ADD ./xstartup /root/.vnc/
RUN chmod -v +x /root/.vnc/xstartup
RUN echo admin123 | vncpasswd -f > /root/.vnc/passwd
RUN chmod -v 600 /root/.vnc/passwd


EXPOSE 5901

#CMD    ["vncserver", "-fg" ]
ENTRYPOINT ["/scripts/entrypoint.sh"]
