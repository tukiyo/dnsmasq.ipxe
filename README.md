dnsmasq.ipxe
============

MacbookAirを使ってclonezillaやCentOSをiPXE boot

- [MacbookAirを使ってclonezillaやCentOSをiPXE bootするの作った - Qiita](http://qiita.com/tukiyo3/items/2a08060e17992fdc6adc)

# 準備

1. brew install dnsmasq
1. Macbook AirにUSB LANアダプターを接続 (en4として認識される)
1. en4のIPアドレスを192.168.9.9に設定
1. USB LANアダプターと、ネットワークブートさせたいPCをLANケーブルで直繋ぎする

## CloneZillaをネットワークブートさせたい場合

1. cd clonezilla
1. ./extract_clonezilla_i486.sh 

を実行し、以下ファイルが作成される。

* filesystem.squashfs
* initrd.img
* vmlinuz

# 起動/終了

## 起動の仕方

1. ./startup.sh で起動、ctrl+Cでdnsmasq停止

## 終了の仕方

1. ./stop.sh で子プロセス終了

# 注意点

* CentOS7はネットワークブート成功していない。後日対応するかも
