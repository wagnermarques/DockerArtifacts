FROM  wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com


#if you are not behind a proxy, comments this out                                                                                                                               
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/                                                                                                                        
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/                                                                                                                         
#ENV all_proxy=http://wagner:nicoals1*@192.168.0.2:3128/                                                                                                                         
#ENV use_proxy=on

#RUN echo "proxy=http://192.168.0.2:3128/" >> /etc/dnf/dnf.conf                                                                                                                  
#RUN echo "proxy_username=wagner" >> /etc/dnf/dnf.conf                                                                                                                           
#RUN echo "proxy_password=nicolas1*" >> /etc/dnf/dnf.conf                                                                                                                        

RUN dnf -y update && dnf -y install git unzip wget && dnf clean all

## Install gradle
ENV GRADLE_DOWNLOAD_URL=https://downloads.gradle.org/distributions/gradle-5.4-bin.zip
ENV GRADLE_ZIP_FILE_NAME=gradle-5.4-bin.zip
ENV GRADLE_UNZIPED_FOLDER_NAME=gradle-5.4
ENV GRADLE_HOME=/opt/gradle

#if you are not behind a proxy, comments this out
#RUN cp /container_config_folder/.wgetrc  ~/

#if you are not behind a proxy, comments this out
#RUN wget --output-document /opt/$GRADLE_ZIP_FILE_NAME -e use_proxy=$use_proxy -e http_proxy=$http_proxy -e https_proxy=$http_proxy $GRADLE_DOWNLOAD_URL
RUN wget --output-document /opt/$GRADLE_ZIP_FILE_NAME $GRADLE_DOWNLOAD_URL


RUN unzip -d /opt /opt/$GRADLE_ZIP_FILE_NAME && mv /opt/$GRADLE_UNZIPED_FOLDER_NAME /opt/gradle
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle -v



## Installing android sdk
ENV ANDROID_SDK_URL=https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip?hl=pt-br
ENV ANDROID_SDK_ZIP_FILE_NAME=sdk-tools-linux-4333796.zip
ENV ANDROID_SDK_HOME=/opt/android/Sdk

RUN mkdir -p $ANDROID_SDK_HOME

RUN cd $ANDROID_SDK_HOME && wget --output-document $ANDROID_SDK_ZIP_FILE_NAME $ANDROID_SDK_URL
RUN cd $ANDROID_SDK_HOME && unzip $ANDROID_SDK_ZIP_FILE_NAME
RUN cd $ANDROID_SDK_HOME && rm $ANDROID_SDK_ZIP_FILE_NAME

ENV PATH=$PATH:$ANDROID_SDK_HOME/tools/bin:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools/bin

ADD ./scripts /scripts

RUN chmod +x /scripts/*.sh
RUN /scripts/setup_container.sh

CMD    ["bash"]

