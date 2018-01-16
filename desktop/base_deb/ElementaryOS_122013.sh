#!/bin/bash
# w.luis.araujo@gmail.com
# Dezembro/2013
#
# Remover conta de visitante
echo "allow-guest=false" >> /etc/lightdm/lightdm.conf
#
### REPOSITÓRIOS
apt-add-repository -y ppa:versable/elementary-update
apt-add-repository -y ppa:versable/elementary-update		## Elementary-tweaks
add-apt-repository -y ppa:mozillateam/firefox-next		## Mozillla Firefox
add-apt-repository -y ppa:jd-team/jdownloader 			## JDownloader
add-apt-repository -y ppa:libreoffice/ppa			## LibreOffice
add-apt-repository -y ppa:am-monkeyd/nautilus-elementary-ppa 	## Nautilus 
apt-add-repository -y ppa:flexiondotorg/shotwell		## Shotwell
add-apt-repository -y ppa:mozillateam/thunderbird-stable 	## sThunderbird
add-apt-repository -y ppa:transmissionbt/ppa 			## Transmission
add-apt-repository -y ppa:rye/ubuntuone-extras			## Ubuntu One Indicator
add-apt-repository -y ppa:n-muench/vlc				## VLC
add-apt-repository -y ppa:videolan/stable-daily			## VLC
add-apt-repository -y ppa:ubuntu-wine/ppa			## Wine	
add-apt-repository -y ppa:webupd8team/java			## Java
add-apt-repository -y ppa:diegolima/sparkleshare-latest 	## SparkleShare
add-apt-repository -y ppa:git-core/ppa				## SparkleShare

### ATUALIZAÇÃO
apt-get update -qq
apt-get upgrade -y
#
### INSTALAÇÃO
# Basic
apt-get install \
openssh-server htop vim aptitude screen testdisk dkms dialog \
#
# Utils
#
apt-get install aptitude  iptraf dnsutils
# Office & Language
apt-get install \ 
language-pack-gnome-pt libreoffice libreoffice-gtk libreoffice-l10n-pt-brmyspell-pt-br \
#
# MultiMedia
apt-get install \
ubuntu-restricted-extras ubuntu-restrict-addons sparkleshare skype pidgin transmission  qbittorrent 
#
# Tweaks
apt-get install elementary-tweaks 
#
# Java
apt-get install openjdk-7-jre icedtea-7-jre 
#
#VPN
apt-get install \
openvpn network-manager network-manager-openvpn network-manager-openvpn-gnome \
