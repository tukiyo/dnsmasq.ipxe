#!/bin/sh
set -eux

IPADDR=192.168.9.9
if [ "`ifconfig en4 | grep $IPADDR`" == "" ];then
    sudo ifconfig en4 alias $IPADDR netmask 0xffffff00
fi

DIRNAME=ipxe
if [ ! -e /tmp/$DIRNAME ];then
    ln -s `pwd`/$DIRNAME /tmp/$DIRNAME
fi

if [ ! `pgrep -f "python -m SimpleHTTPServer 8000"` ];then
    nohup python -m SimpleHTTPServer 8000 &
fi

if [ ! -d "/var/lib/misc" ];then
    sudo mkdir /var/lib/misc
fi

sudo dnsmasq --conf-file=dnsmasq.conf
