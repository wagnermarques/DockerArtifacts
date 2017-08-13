
#!/bin/bash

#USER=$1
#PASSWORD=$2
#ADDRESS=$3
#PORT=$4

#mkdir -p /etc/systemd/system/docker.service.d
#HTTP_PROXY_CONF_FILE=/etc/systemd/system/docker.service.d/http-proxy.conf
#touch $HTTP_PROXY_CONF_FILE

#echo "[service]" > $HTTP_PROXY_CONF_FILE
#echo "Environment=\"HTTP_PROXY=http://$USER:$PASSWORD@$ADDRESS:$PORT\"" >>  $HTTP_PROXY_CONF_FILE


#systemctl daemon-reload
#systemctl restart docker

#systemctl show --property=Environment docker
#echo "HTTP_PROXY environment variable added to systemctl"

#Refs
#https://docs.docker.com/engine/admin/systemd/#runtime-directory-and-storage-driver
#/etc/systemd/system/docker.service.d/http-proxy.conf


#from systemctl status docker
# docker.service - Docker Application Container Engine
#   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
#   Active: active (running) since sab 2017-07-08 16:56:43 -03; 4h 6min ago
#     Docs: http://docs.docker.com
# Main PID: 3239 (dockerd-current)
#    Tasks: 16 (limit: 8192)
#   Memory: 72.5M
#      CPU: 1min 53.006s
#   CGroup: /system.slice/docker.service
#           -3239 /usr/bin/dockerd-current --add-runtime oci=/usr/libexec/docker/docker-runc-current --default-runtime=oci --containerd

#The service file to be changed is:/usr/lib/systemd/system/docker.service
#in the session "[service]"
cat <<EOF | sudo tee -a /usr/lib/systemd/system/docker.service
Environment="HTTP_PROXY=wagner:nicolas1*@192.168.02:3128"
Environment="HTTPS_PROXY=wagner:nicolas1*@192.168.02:3128"
Environment="no_proxy=<REGISTRY_IP>"
EOF


#is need to stop docker service
systemctl stop docker
#reload daemons
systemctl daemon-reload
#start docker againd
systemctl start docker
