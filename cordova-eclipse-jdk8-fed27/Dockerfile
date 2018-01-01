FROM wagnermarques/java-oracle8-f27-vnc:0.0.1
#based on https://github.com/oren/docker-cordova/blob/master/Dockerfile

MAINTAINER wagnerdocri@gmail.com

# Java Version and other

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


RUN dnf update -y  && \
    dnf -y install unzip nodejs

RUN npm install -g cordova

### Downloading android tools sdk and installing
### https://developer.android.com/studio/command-line/sdkmanager.html
ENV androidToolsSdkDlwLink=https://dl.google.com/android/repository/platform-tools-latest-linux.zip
ENV plataformToolsZipFileName=platform-tools-latest-linux.zip
RUN wget -c $androidToolsSdkDlwLink -O /opt/$plataformToolsZipFileName
RUN cd /opt && unzip $plataformToolsZipFileName && ls -l
RUN rm /opt/$plataformToolsZipFileName

### Configuring android plataform
ADD /scripts /scripts
RUN chmod +x /scripts/*.sh
RUN /scripts/sdkmanager-install-package.sh

EXPOSE 5901

CMD    ["vncserver", "-fg" ]
