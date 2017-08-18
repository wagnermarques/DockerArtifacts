#!/bin/bash
# ref: http://blog.codeaholics.org/2013/giving-dockerlxc-containers-a-routable-ip-address/

iptables -t nat -N BRIDGE-VIRTUAL0
iptables -t nat -A PREROUTING -p all -d 192.168.0.253 -j BRIDGE-VIRTUAL0
iptables -t nat -A OUTPUT -p all -d 192.168.0.253 -j BRIDGE-VIRTUAL0

iptables -t nat -A BRIDGE-VIRTUAL0 -p all -j DNAT --to-destination 192.168.33.83
iptables -t nat -I POSTROUTING -p all -s 192.168.33.83 -j SNAT --to-source 192.168.0.253

echo 2 > /proc/sys/net/ipv4/conf/default/rp_filter 
#echo 2 > /proc/sys/net/ipv4/conf/eth0/rp_filter
echo 2 > /proc/sys/net/ipv4/conf/virtual0/rp_filter
