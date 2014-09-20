#!/bin/sh
CLONEZILLA_URL="http://ftp.jaist.ac.jp/pub/sourceforge/c/cl/clonezilla/clonezilla_live_stable/2.2.4-12/clonezilla-live-2.2.4-12-i486.zip"
ls clonezilla-live-*.zip || wget $CLONEZILLA_URL

unzip -j clonezilla-live-*.zip \
  live/filesystem.squashfs \
  live/initrd.img \
  live/vmlinuz \
&& rm -f clonezilla-live-*.zip
