FROM  wagnermarques/java-oracle8-f27-vnc:0.0.1

MAINTAINER wagnerdocri@gmail.com


#if you are not behind a proxy, comments this out                                                                                                                               
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/                                                                                                                        
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/                                                                                                                         
#ENV all_proxy=http://wagner:nicoals1*@192.168.0.2:3128/                                                                                                                         
                                                                                                                                                                                
#RUN echo "proxy=http://192.168.0.2:3128/" >> /etc/dnf/dnf.conf                                                                                                                  
#RUN echo "proxy_username=wagner" >> /etc/dnf/dnf.conf                                                                                                                           
#RUN echo "proxy_password=nicolas1*" >> /etc/dnf/dnf.conf                                                                                                                        
                                                               

RUN dnf -y install git unzip wget nodejs  && dnf clean all
RUN npm install -g cordova
RUN chown -R root:root /usr/lib/node_modules/cordova #in the future change to normal user


## Install gradle
ENV GRADLE_DOWNLOAD_URL=https://downloads.gradle.org/distributions/gradle-4.5-rc-1-bin.zip
ENV GRADLE_ZIP_FILE_NAME=gradle-4.5-rc-1-bin.zip
ENV GRADLE_UNZIPED_FOLDER_NAME=gradle-4.5-rc-1
ENV GRADLE_HOME=/opt/gradle

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

# workaround for adroid command deprecations
# put tools dir of the r25 sdk version on the r38
#RUN mkdir -rf 

# once tools installed, lets config path
#ENV ANDROID_HOME=$ANDROID_SDK_r25_HOME/tools
ENV ANDROID_HOME=$ANDROID_SDK_r38_HOME

ENV PATH=$PATH:$ANDROID_HOME



#RUN $SDKMANAGER "build-tools;25.0.2"
#RUN echo y | $SDKMANAGER  "platform-tools" "platforms;android-26"
#Run (while sleep 6; do echo "y"; done) | $SDKMANAGER --update


RUN mkdir -p /apps
RUN cd /apps/           && cordova create myApp org.apache.cordova.myApp myApp
RUN cd /apps/myApp/     && cordova platform add android
RUN cd /apps/myApp      && cordova requirements
RUN cd /apps/myApp      && gradle wrapper

#RUN node -v
#RUN npm -v 
#RUN npm prefix -g 
#RUN android -v
#UN npm info cordova



#RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /opt/eclipse/eclipse ] && /opt/eclipse/eclipse  &' /etc/X11/xinit/xinitrc
EXPOSE 5901
CMD    ["vncserver", "-fg" ]

