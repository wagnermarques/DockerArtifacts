FROM wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

#if you are not behind a proxy just comment this lines
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


#LIFERAY: Download and Installing
ENV LIFERAY7_DOWNLOAD_LINK=https://ufpr.dl.sourceforge.net/project/lportal/Liferay%20Portal/7.1.0%20GA1/liferay-ce-portal-tomcat-7.1.0-ga1-20180703012531655.zip
ENV LIFERAY7_DOWNLOADED_FILE_NAME=liferay-ce-portal-tomcat-7.1.0-ga1-20180703012531655.zip
RUN wget $LIFERAY7_DOWNLOAD_LINK
RUN unzip $LIFERAY7_DOWNLOADED_FILE_NAME 
RUN rm $LIFERAY7_DOWNLOADED_FILE_NAME


#INSTALLING ANT
ENV ANT_DOWNLOAD_LINK=ftp.unicamp.br/pub/apache//ant/binaries/apache-ant-1.10.5-bin.zip
ENV ANT_HOME=/opt/apache-ant
ENV ANT_DOWNLOADED_FILE=apache-ant-1.10.5-bin.zip
ENV ANT_UNZIPED_FOLDER_NAME=apache-ant-1.10.5
RUN wget --output-document  $ANT_DOWNLOADED_FILE $ANT_DOWNLOAD_LINK
RUN unzip $ANT_DOWNLOADED_FILE
RUN mv $ANT_UNZIPED_FOLDER_NAME $ANT_HOME
ENV PATH=$PATH:$ANT_HOME/bin

#RUN ls -l /liferay-ce-portal-7.1.0-ga1/tomcat-9.0.6
EXPOSE 8080

CMD ["/liferay-ce-portal-7.1.0-ga1/tomcat-9.0.6/bin/catalina.sh", "run"]
