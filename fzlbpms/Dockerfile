FROM wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

#if behind a proxy just uncomment this lines
#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV ftp_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV all_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV use_proxy=yes



RUN dnf -y update
RUN dnf -y install findutils git\
    libreoffice-core libreoffice-core  libreoffice-pyuno libreoffice-rhino libreoffice-pdfimport \
    python-openoffice python3-openoffice unoconv openoffice.org-diafilter \
    tar wget unzip  && dnf clean all



ADD ./scripts /scripts
ADD ./container_config_folder /container_config_folder

#needed just if you are behind a proxy
RUN cp /container_config_folder/.wgetrc  ~/



#INSTALLING ANT
ENV ANT_DOWNLOAD_LINK=http://mirror.nbtelecom.com.br/apache//ant/binaries/apache-ant-1.10.4-bin.zip
ENV ANT_HOME=/opt/apache-ant
ENV ANT_DOWNLOADED_FILE=apache-ant-1.10.4-bin.zip
ENV ANT_UNZIPED_FOLDER_NAME=apache-ant-1.10.4
RUN wget --output-document  $ANT_DOWNLOADED_FILE $ANT_DOWNLOAD_LINK
RUN unzip $ANT_DOWNLOADED_FILE
RUN mv $ANT_UNZIPED_FOLDER_NAME $ANT_HOME
ENV PATH=$PATH:$ANT_HOME/bin


#INSTALLING MAVEN
ENV MAVEN_DOWNLOAD_LINK=http://ftp.unicamp.br/pub/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip
ENV MAVEN_HOME=/opt/apache-maven-3.5.4
ENV MAVEN_DOWNLOADED_FILE=apache-maven-3.5.4-bin.zip
ENV MAVEN_UNZIPED_FOLDER_NAME=apache-maven-3.5.4-bin
RUN wget --output-document  $MAVEN_DOWNLOADED_FILE $MAVEN_DOWNLOAD_LINK
RUN unzip -d /opt $MAVEN_DOWNLOADED_FILE
ENV PATH=$PATH:$MAVEN_HOME/bin
RUN mvn -v

#INSTALLING GRADLE
ENV GRADLE_DOWNLOAD_LINK=https://downloads.gradle.org/distributions/gradle-4.8.1-bin.zip
ENV GRADLE_HOME=/opt/gradle-4.8.1
ENV GRADLE_DOWNLOADED_FILE=gradle-4.8.1-bin.zip
ENV GRADLE_UNZIPED_FOLDER_NAME=gradle-4.8.1-bin
RUN wget --output-document  $GRADLE_DOWNLOADED_FILE $GRADLE_DOWNLOAD_LINK
RUN unzip -d /opt $GRADLE_DOWNLOADED_FILE
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --version




#LIFERAY: Building from source
ENV LIFERAY7_DOWNLOAD_LINK=https://ufpr.dl.sourceforge.net/project/lportal/Liferay%20Portal/7.1.0%20GA1/liferay-ce-portal-tomcat-7.1.0-ga1-20180703012531655.zip
ENV LIFERAY7_DOWNLOADED_FILE_NAME=liferay-ce-portal-tomcat-7.1.0-ga1-20180703012531655.zip

RUN wget --no-check-certificate $LIFERAY7_DOWNLOAD_LINK
RUN unzip $LIFERAY7_DOWNLOADED_FILE_NAME
RUN rm $LIFERAY7_DOWNLOADED_FILE_NAME
RUN mv /liferay-ce-portal-7.1.0-ga1 /opt/liferay



#INSTALLING ORBEONFORMS
ENV ORBEONFORMS_DOWNLOAD_LINK=https://github.com/orbeon/orbeon-forms/releases/download/tag-release-2017.2-ce/orbeon-2017.2.201712300816-CE.zip
ENV ORBEONFORMS_HOME=/opt/orbeon-2017.2.201712300816-CE
ENV ORBEONFORMS_DOWNLOADED_FILE=orbeon-2017.2.201712300816-CE.zip
ENV ORBEONFORMS_UNZIPED_FOLDER_NAME=orbeon-2017.2.201712300816-CE
RUN wget --output-document  $ORBEONFORMS_DOWNLOADED_FILE $ORBEONFORMS_DOWNLOAD_LINK
RUN unzip -d /opt $ORBEONFORMS_DOWNLOADED_FILE
RUN rm $ORBEONFORMS_DOWNLOADED_FILE
RUN cp $ORBEONFORMS_HOME/orbeon.war /opt/liferay/tomcat-9.0.6/webapps



EXPOSE 8080

ENV CATALINA_HOME=/opt/liferay/tomcat-9.0.6
RUN cp /container_config_folder/portal-ext.properties /opt/liferay/
RUN ls -la /opt/liferay
CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out

 
