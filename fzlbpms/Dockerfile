FROM wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

ENV http_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV ftp_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV all_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV use_proxy=yes


ENV GRADLE_VERSION=5.4.1
ENV GRADLE_DOWNLOAD_LINK=https://downloads.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip
ENV GRADLE_HOME=/opt/gradle-$GRADLE_VERSION
ENV GRADLE_DOWNLOADED_FILE=gradle-$GRADLE_VERSION-bin.zip
ENV GRADLE_UNZIPED_FOLDER_NAME=gradle-$GRADLE_VERSION-bin

ENV MAVEN_VERSION=3.6.1
ENV MAVEN_DOWNLOAD_LINK=http://ftp.unicamp.br/pub/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip
ENV MAVEN_HOME=/opt/apache-maven-$MAVEN_VERSION
ENV MAVEN_DOWNLOADED_FILE=apache-maven-$MAVEN_VERSION-bin.zip
ENV MAVEN_UNZIPED_FOLDER_NAME=apache-maven-$MAVEN_VERSION-bin

ENV ANT_VERSION=1.10.5
ENV ANT_DOWNLOAD_LINK=http://mirror.nbtelecom.com.br/apache/ant/binaries/apache-ant-$ANT_VERSION-bin.zip
ENV ANT_HOME=/opt/apache-ant
ENV ANT_DOWNLOADED_FILE=apache-ant-ANT_$VERSION-bin.zip
ENV ANT_UNZIPED_FOLDER_NAME=apache-ant-$ANT_VERSION

ENV TOMCAT_VERSION=8.5.41
ENV TOMCAT_DOWNLOAD_LINK=http://ftp.unicamp.br/pub/apache/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV TOMCAT_DOWNLOADED_FILENAME=apache-tomcat-$TOMCAT_VERSION.tar.gz

ENV ORBEONFORMS_DOWNLOAD_LINK=https://github.com/orbeon/orbeon-forms/releases/download/tag-release-2017.2-ce/orbeon-2017.2.201712300816-CE.zip
ENV ORBEONFORMS_HOME=/opt/orbeon-2017.2.201712300816-CE
ENV ORBEONFORMS_DOWNLOADED_FILE=orbeon-2017.2.201712300816-CE.zip
ENV ORBEONFORMS_UNZIPED_FOLDER_NAME=orbeon-2017.2.201712300816-CE

ENV ODE_VERSION=1.3.8
ENV ODE_DOWNLOAD_LINK=www.apache.org/dyn/closer.cgi/ode/apache-ode-war-$ODE_VERSION.zip

ENV POSTGRESQL_JDBC_CONNECTOR_DOWNLOAD_LINK=https://jdbc.postgresql.org/download/postgresql-42.2.5.jar
ENV POSTGRESQL_JDBC_CONNECTOR_DOWNLOADED_FILENAME=postgresql-42.2.5.jar
ENV MARIADB_JDBC_CONECTOR_DOWNLOAD_LINK=https://downloads.mariadb.com/Connectors/java/connector-java-2.4.1/mariadb-java-client-2.4.1.jar
ENV MARIADB_JDBC_CONECTOR_DOWNLOADED_FILENAME=mariadb-java-client-2.4.1.jar        


ADD ./scripts /scripts
ADD ./container_config_folder /container_config_folder

#needed just if you are behind a proxy
RUN cp /container_config_folder/.wgetrc  ~/


RUN wget $ODE_DOWNLOAD_LINK
RUN wget --output-document  $GRADLE_DOWNLOADED_FILE $GRADLE_DOWNLOAD_LINK
RUN wget --output-document  $MAVEN_DOWNLOADED_FILE $MAVEN_DOWNLOAD_LINK
RUN wget --output-document  $ANT_DOWNLOADED_FILE $ANT_DOWNLOAD_LINK
RUN wget --output-document /$TOMCAT_DOWNLOADED_FILENAME  -e use_proxy=on -e http_proxy=$http_proxy -e https_proxy=$http_proxy $TOMCAT_DOWNLOAD_LINK


RUN wget --output-document  $ORBEONFORMS_DOWNLOADED_FILE $ORBEONFORMS_DOWNLOAD_LINK

RUN wget --output-document /$POSTGRESQL_JDBC_CONNECTOR_DOWNLOADED_FILENAME $POSTGRESQL_JDBC_CONNECTOR_DOWNLOAD_LINK
RUN wget --output-document /$MARIADB_JDBC_CONECTOR_DOWNLOADED_FILENAME $MARIADB_JDBC_CONECTOR_DOWNLOAD_LINK


ENV CATALINA_HOME=/opt/tomcat


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

RUN npm i @dojo/cli @dojo/cli-create-app -g 


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


#INSTALLING ORBEONFORMS
RUN unzip -d /opt $ORBEONFORMS_DOWNLOADED_FILE
RUN rm $ORBEONFORMS_DOWNLOADED_FILE


#KARAF
RUN wget http://ftp.unicamp.br/pub/apache/karaf/4.2.6/apache-karaf-4.2.6.tar.gz 

RUN tar xvf apache-karaf-4.2.6.tar.gz
RUN rm apache-karaf-4.2.6.tar.gz
RUN mv apache-karaf-4.2.6 /opt
ENV KARAF_HOME=/opt/apache-karaf-4.2.6
ENV PATH=:$PATH:$KARAF_HOME/bin

#---------- All downloads firts to facilitate rebuild image

#---------- installing and configuring tomcat
RUN tar xf $TOMCAT_DOWNLOADED_FILENAME
RUN rm $TOMCAT_DOWNLOADED_FILENAME
RUN mv apache-tomcat-8.5.41 $CATALINA_HOME
RUN chmod +x $CATALINA_HOME/bin/*.sh
ENV PATH=:$PATH:$CATALINA_HOME/bin

#---------- installing ode webapp in tomcat

RUN rm $ANT_DOWNLOADED_FILE
RUN rm $MAVEN_DOWNLOADED_FILE
RUN rm $GRADLE_DOWNLOADED_FILE

EXPOSE 8080 8101



CMD apache-karaf-4.2.0/bin/karaf	 

 
