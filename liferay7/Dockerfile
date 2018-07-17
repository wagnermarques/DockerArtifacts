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



#LIFERAY: Building from source
#https://community.liferay.com/blogs/-/blogs/how-can-i-build-liferay-7-0-from-source-
ENV LIFERAY7_DOWNLOAD_LINK=https://ufpr.dl.sourceforge.net/project/lportal/Liferay%20Portal/7.1.0%20GA1/liferay-ce-portal-wildfly-7.1.0-ga1-20180703012531655.zip
ENV LIFERAY7_DOWNLOADED_FILE_NAME=liferay-ce-portal-wildfly-7.1.0-ga1-20180703012531655.zip
RUN wget $LIFERAY7_DOWNLOAD_LINK
RUN unzip liferay-ce-portal-wildfly-7.1.0-ga1-20180703012531655.zip
RUN rm $LIFERAY7_DOWNLOADED_FILE_NAME




#INSTALLING ANT
ENV ANT_DOWNLOAD_LINK=http://mirror.nbtelecom.com.br/apache//ant/binaries/apache-ant-1.10.4-bin.zip
ENV ANT_HOME=/opt/apache-ant
ENV ANT_DOWNLOADED_FILE=apache-ant-1.10.4-bin.zip
ENV ANT_UNZIPED_FOLDER_NAME=apache-ant-1.10.4
RUN wget --output-document  $ANT_DOWNLOADED_FILE $ANT_DOWNLOAD_LINK
RUN unzip $ANT_DOWNLOADED_FILE
RUN mv $ANT_UNZIPED_FOLDER_NAME $ANT_HOME
ENV PATH=$PATH:$ANT_HOME/bin



#BUILDING LIFERAY 7
#TO BUILD FROM SOURCE USE THIS...
ENV APP_SERVER_PARENT_DIR=$WILDFLY_HOME
RUN cd $APP_SERVER_PARENT_DIR &&  git clone -b 7.1.x https://github.com/liferay/liferay-portal.git --depth 1
RUN cd $APP_SERVER_PARENT_DIR/liferay-portal && echo "app.server.parent.dir=$APP_SERVER_PARENT_DIR" > "app.server.$(whoami).properties"
RUN cd $APP_SERVER_PARENT_DIR/liferay-portal && echo "app.server.type=wildfly" >> "app.server.$(whoami).properties"
ENV ANT_OPTS="-Xmx2560m"
RUN cd $APP_SERVER_PARENT_DIR/liferay-portal && ant -f build-dist.xml  unzip-wildfly
RUN cd $APP_SERVER_PARENT_DIR/liferay-portal && ant clean all




#------
#Deploying orbeon forms porlet
#I've been downloaded orbeon manually
#------
RUN unzip -d /opt/ /container_config_folder/downloads/orbeon-2017.2.201712300816-CE.zip
RUN ls -l /opt/orbeon-2017.2.201712300816-CE

# Define default command.
CMD $LIFERAY_HOME/tomcat-8.0.32/bin/startup.sh && tail -f $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out

EXPOSE 8080

CMD ["/liferay-ce-portal-7.1.0-ga1/wildfly-11.0.0/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
