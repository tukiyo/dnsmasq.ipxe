#!/bin/sh
CLONEZILLA_URL="https://jaist.dl.osdn.jp/clonezilla/69909/clonezilla-live-20180812-bionic-amd64.zip"
ls clonezilla-live-*.zip || wget $CLONEZILLA_URL

unzip -j clonezilla-live-*.zip \
  live/filesystem.squashfs \
  live/initrd.img \
  live/vmlinuz \
&& rm -f clonezilla-live-*.zip
