#!/bin/sh
CLONEZILLA_URL="http://citylan.dl.sourceforge.net/project/clonezilla/clonezilla_live_alternative/20141208-utopic/clonezilla-live-20141208-utopic-amd64.zip"
#ls clonezilla-live-*.zip || wget $CLONEZILLA_URL

unzip -j clonezilla-live-*.zip \
  live/filesystem.squashfs \
  live/initrd.img \
  live/vmlinuz \
&& rm -f clonezilla-live-*.zip
