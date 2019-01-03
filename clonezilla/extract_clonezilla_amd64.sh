#!/bin/sh
CLONEZILLA_URL="http://iij.dl.osdn.jp/clonezilla/69912/clonezilla-live-2.5.6-22-amd64.zip"
ls clonezilla-live-*.zip || wget $CLONEZILLA_URL

unzip -j clonezilla-live-*.zip \
  live/filesystem.squashfs \
  live/initrd.img \
  live/vmlinuz \
&& rm -f clonezilla-live-*.zip
