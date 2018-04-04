if [ ! -e initrd.img ];then
    wget http://mirror.centos.org/centos/7/os/x86_64/images/pxeboot/initrd.img
fi
if [ ! -e vmlinuz ];then
    wget http://mirror.centos.org/centos/7/os/x86_64/images/pxeboot/vmlinuz
fi

echo "done";
