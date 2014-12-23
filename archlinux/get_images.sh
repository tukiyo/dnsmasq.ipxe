BASE_URL=http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/iso/latest/arch

for arch in x86_64 i686
do
  echo \#\# $arch
  if [ ! -d $arch ];then
      mkdir $arch
  fi
  wget -c ${BASE_URL}/boot/$arch/vmlinuz -O $arch/vmlinuz
  wget -c ${BASE_URL}/boot/$arch/archiso.img -O $arch/initrd.img 
  wget -c ${BASE_URL}/$arch/airootfs.sfs -O $arch/airootfs.sfs 
done
