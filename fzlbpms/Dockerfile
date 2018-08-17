FROM wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

ENV http_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV ftp_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV all_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV use_proxy=yes

ENV GRADLE_DOWNLOAD_LINK=https://downloads.gradle.org/distributions/gradle-4.8.1-bin.zip
ENV GRADLE_HOME=/opt/gradle-4.8.1
ENV GRADLE_DOWNLOADED_FILE=gradle-4.8.1-bin.zip
ENV GRADLE_UNZIPED_FOLDER_NAME=gradle-4.8.1-bin

ENV MAVEN_DOWNLOAD_LINK=http://ftp.unicamp.br/pub/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip
ENV MAVEN_HOME=/opt/apache-maven-3.5.4
ENV MAVEN_DOWNLOADED_FILE=apache-maven-3.5.4-bin.zip
ENV MAVEN_UNZIPED_FOLDER_NAME=apache-maven-3.5.4-bin

ENV ANT_DOWNLOAD_LINK=http://mirror.nbtelecom.com.br/apache//ant/binaries/apache-ant-1.10.5-bin.zip
ENV ANT_HOME=/opt/apache-ant
ENV ANT_DOWNLOADED_FILE=apache-ant-1.10.5-bin.zip
ENV ANT_UNZIPED_FOLDER_NAME=apache-ant-1.10.5

ENV TOMCAT9_DOWNLOAD_LINK=http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.10/bin/apache-tomcat-9.0.10.tar.gz

ENV ORBEONFORMS_DOWNLOAD_LINK=https://github.com/orbeon/orbeon-forms/releases/download/tag-release-2017.2-ce/orbeon-2017.2.201712300816-CE.zip
ENV ORBEONFORMS_HOME=/opt/orbeon-2017.2.201712300816-CE
ENV ORBEONFORMS_DOWNLOADED_FILE=orbeon-2017.2.201712300816-CE.zip
ENV ORBEONFORMS_UNZIPED_FOLDER_NAME=orbeon-2017.2.201712300816-CE


ADD ./scripts /scripts
ADD ./container_config_folder /container_config_folder

#needed just if you are behind a proxy
RUN cp /container_config_folder/.wgetrc  ~/


RUN wget --output-document  $GRADLE_DOWNLOADED_FILE $GRADLE_DOWNLOAD_LINK
RUN wget --output-document  $MAVEN_DOWNLOADED_FILE $MAVEN_DOWNLOAD_LINK
RUN wget --output-document  $ANT_DOWNLOADED_FILE $ANT_DOWNLOAD_LINK
RUN wget --output-document /tomcat9.tar.gz  -e use_proxy=on -e http_proxy=$http_proxy -e https_proxy=$http_proxy $TOMCAT9_DOWNLOAD_LINK

RUN wget --output-document  $ORBEONFORMS_DOWNLOADED_FILE $ORBEONFORMS_DOWNLOAD_LINK

RUN wget --output-document /postgresql-42.2.4.jar https://jdbc.postgresql.org/download/postgresql-42.2.4.jar


ENV CATALINA_HOME=/opt/tomcat9


RUN dnf -y update
RUN dnf -y install findutils git \
    libreoffice-core libreoffice-core  libreoffice-pyuno libreoffice-rhino libreoffice-pdfimport \
    python-openoffice python3-openoffice unoconv openoffice.org-diafilter \
    tar wget unzip \
    nodejs npm;

RUN dnf clean all;

RUN npm config set proxy 'http://cid2:cid2@192.168.0.2:3128/'
RUN npm config set https-proxy 'http://cid2:cid2@192.168.0.2:3128/'

RUN npm install -g grunt-cli
RUN npm install -g yo generator-generator
RUN npm install -g http-server express
RUN npm install -g webpack typescript ts-loader
RUN npm install -g jquery
RUN npm install -g @dojo/cli @dojo/cli-create-app @dojo/cli-build-app
RUN npm install -g @dojo/cli-build-widget @dojo/cli-create-widget
RUN npm install -g intern @dojo/cli-test-intern



#INSTALLING ANT


RUN unzip $ANT_DOWNLOADED_FILE
RUN mv $ANT_UNZIPED_FOLDER_NAME $ANT_HOME
ENV PATH=$PATH:$ANT_HOME/bin


#INSTALLING MAVEN
RUN unzip -d /opt $MAVEN_DOWNLOADED_FILE
ENV PATH=$PATH:$MAVEN_HOME/bin
RUN mvn -v


#INSTALLING GRADLE
RUN unzip -d /opt $GRADLE_DOWNLOADED_FILE
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --version



#LIFERAY: Download and Installing
RUN unzip $LIFERAY7_DOWNLOADED_FILE_NAME 
RUN rm $LIFERAY7_DOWNLOADED_FILE_NAME




#INSTALLING ORBEONFORMS
RUN unzip -d /opt $ORBEONFORMS_DOWNLOADED_FILE
RUN rm $ORBEONFORMS_DOWNLOADED_FILE
#RUN cp $ORBEONFORMS_HOME/orbeon.war /opt/liferay/tomcat-9.0.6/webapps



#KARAF
RUN wget http://ftp.unicamp.br/pub/apache/karaf/4.2.0/apache-karaf-4.2.0.tar.gz
RUN tar xvf apache-karaf-4.2.0
RUN ls -l



#---------- All downloads firts to facilitate rebuild image

#---------- installing and configuring tomcat
RUN tar xf tomcat9.tar.gz &&  mv apache-tomcat-9.0.10 /opt/tomcat9
RUN chmod +x $CATALINA_HOME/bin/*.sh
ENV PATH=:$PATH:$CATALINA_HOME/bin


EXPOSE 8080

ENV CATALINA_HOME=/opt/liferay/tomcat-9.0.6
RUN cp /container_config_folder/portal-ext.properties /opt/liferay/
CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out

 
