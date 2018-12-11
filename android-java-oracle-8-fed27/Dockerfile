FROM  wagnermarques/java-oracle8-f27-vnc:0.0.1

MAINTAINER wagnerdocri@gmail.com

ADD ./container_config_folder /container_config_folder

#if you are not behind a proxy, comments this out                                                                                                                               
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/                                                                                                                        
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/                                                                                                                         
#ENV all_proxy=http://wagner:nicoals1*@192.168.0.2:3128/                                                                                                                         
#ENV use_proxy=on

#RUN echo "proxy=http://192.168.0.2:3128/" >> /etc/dnf/dnf.conf                                                                                                                  
#RUN echo "proxy_username=wagner" >> /etc/dnf/dnf.conf                                                                                                                           
#RUN echo "proxy_password=nicolas1*" >> /etc/dnf/dnf.conf                                                                                                                        

RUN dnf -y update && dnf -y install git unzip wget nodejs && dnf clean all


#if you are not behind a proxy, comments this out
#RUN npm config set proxy http://wagner:nicolas1*@192.168.0.2:3128/
#RUN npm config set https-proxy http://wagner:nicolas1*@192.168.0.2:3128/

RUN npm install -g cordova
RUN chown -R root:root /usr/lib/node_modules/cordova #in the future change to normal user


## Install gradle
ENV GRADLE_DOWNLOAD_URL=https://downloads.gradle.org/distributions/gradle-4.5-rc-1-bin.zip
ENV GRADLE_ZIP_FILE_NAME=gradle-4.5-rc-1-bin.zip
ENV GRADLE_UNZIPED_FOLDER_NAME=gradle-4.5-rc-1
ENV GRADLE_HOME=/opt/gradle

#if you are not behind a proxy, comments this out
RUN cp /container_config_folder/.wgetrc  ~/

#if you are not behind a proxy, comments this out
#RUN wget --output-document /opt/$GRADLE_ZIP_FILE_NAME -e use_proxy=$use_proxy -e http_proxy=$http_proxy -e https_proxy=$http_proxy $GRADLE_DOWNLOAD_URL
RUN wget --output-document /opt/$GRADLE_ZIP_FILE_NAME $GRADLE_DOWNLOAD_URL


RUN unzip -d /opt /opt/$GRADLE_ZIP_FILE_NAME && mv /opt/$GRADLE_UNZIPED_FOLDER_NAME /opt/gradle
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle -v



## Installing android sdk
# android sdk is a workarount for android command deprecation
ENV ANDROID_SDK_r25_URL=https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
ENV ANDROID_SDK_r25_ZIP_FILE_NAME=tools_r25.2.3-linux.zip
ENV ANDROID_SDK_r25_HOME=/opt/Android_r25/tools

# lastest android sdk. Its tools dir will be changed for r25 tools to habilitate android command
ENV ANDROID_SDK_r38_URL=https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip?hl=pt-br
ENV ANDROID_SDK_r38_ZIP_FILE_NAME=sdk-tools-linux-3859397.zip
ENV ANDROID_SDK_r38_HOME=/opt/Android_r38/tools

RUN wget --output-document /opt/$ANDROID_SDK_r25_ZIP_FILE_NAME $ANDROID_SDK_r25_URL
RUN wget --output-document /opt/$ANDROID_SDK_r38_ZIP_FILE_NAME $ANDROID_SDK_r38_URL


RUN mkdir -p $ANDROID_SDK_r38_HOME
RUN mkdir -p $ANDROID_SDK_r25_HOME

RUN unzip /opt/$ANDROID_SDK_r25_ZIP_FILE_NAME -d /opt && mv /opt/tools $ANDROID_SDK_r25_HOME
RUN unzip /opt/$ANDROID_SDK_r38_ZIP_FILE_NAME -d /opt && mv /opt/tools $ANDROID_SDK_r38_HOME

# workaround for android command deprecations
# put tools dir of the r25 sdk version on the r38
RUN echo "ANDROID_SDK_r25_HOME=$ANDROID_SDK_r25_HOME"
RUN echo "ANDROID_SDK_r38_HOME=$ANDROID_SDK_r38_HOME"

# once tools installed, lets config path
#ENV ANDROID_HOME=$ANDROID_SDK_r25_HOME/tools
ENV ANDROID_HOME=$ANDROID_SDK_r38_HOME

ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

ADD ./scripts /scripts
ADD ./container_build_outputs /container_build_outputs
#https://stackoverflow.com/questions/42638589/android-studio-sdk-manager
RUN cd  $ANDROID_SDK_r38_HOME && rm -rf tools
RUN cp -r $ANDROID_SDK_r25_HOME/tools $ANDROID_SDK_r38_HOME


#RUN $SDKMANAGER "build-tools;25.0.2"
#RUN echo y | $SDKMANAGER  "platform-tools" "platforms;android-26"
#Run (while sleep 6; do echo "y"; done) | $SDKMANAGER --update




#from: https://github.com/kelvinlawson/dockerfile-android-studio/blob/master/Dockerfile

RUN wget --output-document /opt/androidstudio.zip https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip?hl=pt-br
RUN unzip /opt/androidstudio.zip -d /opt
RUN ls -l /opt
RUN useradd -u 1000 developer
# Set up permissions for X11 access.
# Replace 1000 with your user / group id.
RUN mkdir -p /home/developer/.vnc && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    usermod -a -G wheel developer && \
    chown developer:developer -R $ANDROID_SDK_r38_HOME && \
    chown developer:developer -R $ANDROID_SDK_r25_HOME && \
    chown developer:developer -R /home/developer && \
    chown developer:developer -R /opt/android-studio && \
    chown developer:developer -R /container_config_folder && \
    chown developer:developer -R /container_build_outputs #put this line more


# Add the xstartup file into the image and set the default password.
RUN cat /root/.vnc/xstartup > /home/developer/.vnc/xstartup
RUN chmod -v +x /home/developer/.vnc/xstartup


# Set up USB device debugging (device is ID in the rules files)
#RUN ls -l /etc/
#RUN cp /container_config_folder/51-android.rules /etc/udev/rules.d
#RUN chmod a+r /etc/udev/rules.d/51-android.rules
RUN dnf install -y passwd which
RUN echo 'admin123' | passwd root --stdin
USER developer
RUN echo admin123 | vncpasswd -f > /home/developer/.vnc/passwd
RUN chmod -v 600 /home/developer/.vnc/passwd

ENV HOME /home/developer

RUN node -v > /container_build_outputs/node_version
RUN npm -v > /container_build_outputs/npm_version
RUN npm prefix -g > /container_build_outputs/npm_prefix_g
#RUN java -version
#RUN javac -version
#RUN echo "JAVA_HOME=$JAVA_HOME"
#RUN ls -l /opt/Android_r38/tools
#RUN ls -l /opt/Android_r38/tools/tools
#RUN android --verbose update sdk --no-ui
#RUN android update sdk --no-ui
#RUN android list sdk
#RUN adb


#RUN mkdir -p /apps
#RUN cd /apps/           && cordova create myApp org.apache.cordova.myApp myApp
#RUN cd /apps/myApp/     && cordova platform add android
#RUN cd /apps/myApp/      && gradle wrapper
#RUN cd /apps/myApp/      && cordova requirements


#RUN npm info cordova


#RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /opt/eclipse/eclipse ] && /opt/eclipse/eclipse  &' /etc/X11/xinit/xinitrc
EXPOSE 5901
CMD    ["vncserver", "-fg" ]

