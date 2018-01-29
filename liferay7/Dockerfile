FROM wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

ENV LIFERAYFILE=liferay-ce-portal-tomcat-7.0-ga3-20160804222206210.zip
ENV LIFERAY_HOME=/opt/liferay-ce-portal-7.0-ga3
ENV ORBEONFORMS_DOWNLOAD_URL=https://github-production-release-asset-2e65be.s3.amazonaws.com/255478/1d20cf68-ee17-11e7-9bf6-44d68ed79293?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20180127%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180127T124941Z&X-Amz-Expires=300&X-Amz-Signature=6f6cb41ff92338d308140082222774851bc615acd4fd2c74337b9f166b959295&X-Amz-SignedHeaders=host&actor_id=77413&response-content-disposition=attachment%3B%20filename%3Dorbeon-2017.2.201712300816-CE.zip&response-content-type=application%2Foctet-stream
ENV ORBEONFORMS_DOWNLOADED_FILE=orbeonforms.zip

RUN dnf -y update
RUN dnf -y install findutils \
    libreoffice-core libreoffice-core  libreoffice-pyuno libreoffice-rhino libreoffice-pdfimport \
    python-openoffice python3-openoffice unoconv openoffice.org-diafilter \
    tar wget unzip  && dnf clean all

ADD ./scripts /scripts
ADD ./container_config_folder /container_config_folder

#------
#Installing liferay
#------
RUN wget --output-document /opt/$LIFERAYFILE "https://downloads.sourceforge.net/project/lportal/Liferay%20Portal/7.0.2%20GA3/liferay-ce-portal-tomcat-7.0-ga3-20160804222206210.zip?r=https%3A%2F%2Fwww.liferay.com%2Fdownloads&ts=1485642085&use_mirror=ufpr"
RUN cd /opt && unzip $LIFERAYFILE
RUN touch $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out
RUN rm /opt/$LIFERAYFILE
RUN cp /container_config_folder/portal-setup-wizard.properties /opt/liferay-ce-portal-7.0-ga3/
#RUN wget -o        https://downloads.mariadb.com/Connectors/java/connector-java-2.2.1/mariadb-java-client-2.2.1.jar
#RUN ls -ilha /opt/liferay-ce-portal-7.0-ga3/

#------
#Deploying orbeon forms porlet
#I've been downloaded orbeon manually
#------
#RUN unzip -d /opt/ /container_config_folder/downloads/orbeon-2017.2.201712300816-CE.zip
#RUN ls -l /opt/orbeon-2017.2.201712300816-CE

# Define default command.
#CMD $LIFERAY_HOME/tomcat-8.0.32/bin/startup.sh && tail -f $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out
ENTRYPOINT ["/scripts/entrypoint.sh"]
