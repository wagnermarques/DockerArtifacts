
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

cat <<EOF | sudo tee -a /etc/sysconfig/docker
export http_proxy="http://wagner:nicolas1*@192.168.02:3128"
export https_proxy="http://wagner:nicolas1*@192.168.02:3128"
export no_proxy=<REGISTRY_IP>
EOF
