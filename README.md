dnsmasq.ipxe
============

MacbookAirを使ってclonezillaやCentOSをiPXE boot

- [MacbookAirを使ってclonezillaやCentOSをiPXE bootするの作った - Qiita](http://qiita.com/tukiyo3/items/2a08060e17992fdc6adc)


* [download - dnsmasq.ipxe](https://github.com/tukiyo/dnsmasq.ipxe)
* [iPXEでCentOS5,6インストーラをboot - Qiita](http://qiita.com/tukiyo3/items/bdb4d28d4fa7059c5d14)

# 環境

* dnsmasq (`brew install dnsmasq`)
  * DHCPサーバ、TFTPサーバ
* [iPXE](http://ipxe.org)、[ROM-o-matic.eu | Generate iPXE images | open source network boot firmware](https://rom-o-matic.eu/)
  * PXE BOOTイメージ
* MacbookAir + [usb nic](http://buffalo.jp/products/catalog/network/lua3-u2-atx/)
* HTTPサーバ + [CloneZilla](http://sourceforge.jp/projects/sfnet_clonezilla/releases/)
  * HTTPサーバのためTFTPより3倍くらい転送速度が早い

## 構成図

![ネットワーク図.png](https://qiita-image-store.s3.amazonaws.com/0/25728/299e3c28-15cf-849f-4bae-f0d8cdcef57c.png)

# 準備

1. brew install dnsmasq
1. Macbook AirにUSB LANアダプターを接続 (en4として認識される)
1. en4のIPアドレスを192.168.9.9に設定
1. USB LANアダプターと、ネットワークブートさせたいPCをLANケーブルで直繋ぎする


## CloneZillaをネットワークブートさせたい場合

1. cd clonezilla
1. ./extract_clonezilla_i686.sh

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
* PXEブートの途中で止まる場合、PXEブートイメージを切り替えてください。

```diff:dnsmasq.conf
  # PXEブート完了しない場合は、以下切り替えて試すこと。
- dhcp-boot=undionly.kpxe
+ dhcp-boot=ipxe.kkpxe
  #dhcp-boot=ipxe.kkkpxe
```

* インターネット共有をしていると以下エラーが出るので同時にはしないこと。

> dnsmasq: failed to bind DHCP server socket: Address already in use

![インターネット共有.png](https://qiita-image-store.s3.amazonaws.com/0/25728/f6c26db8-c9d1-2d6c-5f8a-6aee8d9bd61a.png)
