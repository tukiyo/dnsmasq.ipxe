#!/bin/sh
set -eux
IPADDR=192.168.9.9
sudo ifconfig en4 -alias $IPADDR

DIRNAME=dnsmasq.ipxe
if [ -e /tmp/$DIRNAME ];then
    unlink /tmp/$DIRNAME
fi

pkill -f "python -m SimpleHTTPServer 8000" && rm nohup.out
