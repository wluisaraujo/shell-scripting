#!/bin/bash
# w.luis.araujo@gmail.com
# Junho/2015
# Para Sistemas ElementaryOS
#
## Remover conta de visitante
echo "allow-guest=false" >> /etc/lightdm/lightdm.conf

### REPOSITÓRIOS
apt-add-repository -y ppa:versable/elementary-update		## Elementary-tweaks
apt-add-repository -y ppa:versable/elementary-update		## Elementary-tweaks
add-apt-repository -y ppa:mozillateam/firefox-next		## Mozillla Firefox
add-apt-repository -y ppa:jd-team/jdownloader 			## JDownloader
add-apt-repository -y ppa:libreoffice/ppa			## LibreOffice
add-apt-repository -y ppa:am-monkeyd/nautilus-elementary-ppa 	## Nautilus 
apt-add-repository -y ppa:flexiondotorg/shotwell		## Shotwell
add-apt-repository -y ppa:mozillateam/thunderbird-stable 	## Thunderbird
add-apt-repository -y ppa:transmissionbt/ppa 			## Transmission
add-apt-repository -y ppa:rye/ubuntuone-extras			## Ubuntu One Indicator
add-apt-repository -y ppa:n-muench/vlc				## VLC
add-apt-repository -y ppa:videolan/stable-daily			## VLC
add-apt-repository -y ppa:videolan/master-daily			## VLC
add-apt-repository -y ppa:ubuntu-wine/ppa			## Wine	
add-apt-repository -y ppa:webupd8team/java			## Java

### ATUALIZAÇÃO
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

### INSTALAÇÃO

## Elementary Tweaks and other goodies
apt-add-repository ppa:versable/elementary-update -y
apt-get update
apt-get install elementary-tweaks

## Install file archiving resources
apt-get install unace rar unrar p7zip-rar p7zip zip unzip sharutils uudeview mpack lha arj cabextract lzip lunzip file-roller

##
apt-get install software-properties-gtk adobe-flashplugin

## Install these codecs for your multimedia
apt-get install ubuntu-restricted-extras ubuntu-restrict-addons sparkleshare skype pidgin transmission  qbittorrent 
apt-get install libavcodec-extra-53 libdvdread4
apt-get install vlc 
apt-get install flashplugin-installer gsfonts-x11 libxine1-ffmpeg gxine mencoder mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 ffmpeg totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 libjpeg-progs flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview flac libmpeg3-1 mpeg3-utils mpegdemux liba52-0.7.4-dev libquicktime2 gstreamer0.10-ffmpeg gstreamer0.10-fluendo-mp3 gstreamer0.10-gnonlin gstreamer0.10-sdl gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly totem-plugins-extra gstreamer-dbus-media-service gstreamer-tools ubuntu-restricted-extras 

## Microsoft font compatibility
apt-get install ttf-mscorefonts-installer

## Basic
apt-get install \
openssh-server htop vim aptitude screen testdisk dkms dialog \
#
# Util
#
apt-get install \
aptitude  iptraf dnsutils
# Office & Language
apt-get install \ 
language-pack-gnome-pt libreoffice libreoffice-gtk libreoffice-l10n-pt-brmyspell-pt-br \
#


#
# Java
apt-get install \
openjdk-7-jre icedtea-7-jre \
#
#VPN
apt-get install \
openvpn network-manager network-manager-openvpn network-manager-openvpn-gnome \
