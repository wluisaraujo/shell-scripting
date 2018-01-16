#!/bin/bash

## script to install everything

## Update 03/Maio/2015 - w.luis.araujo@gmail.com

###########
echo " "
echo "*****************************************************************"
echo "*             This script is optimised for Fedora 21            *" 
echo "*               (but should work with any version)              *"
echo "*****************************************************************"
echo " "
###########
echo " "
echo "*****************************************************************"
echo "*                      Disabled Selinux                         *"
echo "*****************************************************************"
echo " "
# sed -i 's/permissive/disabled/g' /etc/selinux/config
selinuxenabled && echo enabled || echo disabled enabled 
###########
echo " "
echo "*****************************************************************"
echo "*                      Updating System                          *"
echo "*****************************************************************"
echo " "
yum -y update
yum -y upgrade
###########
echo " "
echo "*****************************************************************"
echo "*                  Installing Repositories                      *"
echo "*****************************************************************"
echo " "
## Repositório RPMfusion Free
yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
## Repositório RPMfusion Nonfree
yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
## Repositórios Russian Fedora Free
http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/fedora/russianfedora-free-release-stable.noarch.rpm -y
## Repositórios Russian Fedora NonFree
yum -y localinstall http://mirror.yandex.ru/fedora/russianfedora/russianfedora/nonfree/fedora/russianfedora-nonfree-release-stable.noarch.rpm -y
## Repositório Adobe
yum -y localinstall --nogpgcheck http://linuxdownload.adobe.com/linux/$(uname -m)/adobe-release-$(uname -m)-1.0-1.noarch.rpm
## Repositório Wine
yum -y localinstall http://sourceforge.net/projects/postinstaller/files/fedora/releases/21/x86_64/winetricks-20130919-1.fc21.noarch.rpm/download
## Codecs for reading some encrypted DVDs
rpm -ivh http://rpm.livna.org/livna-release.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-livna
## Repositorio Google
#yum -y localinstall --nogpgcheck https://dl.google.com/linux/direct/google-chrome-stable_current_$(uname -m).rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
##
echo " "
echo "*****************************************************************"
echo "*                Installing Google Repository                   *"
echo "*****************************************************************"
echo " "

cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
###########
echo " "
echo "*****************************************************************"
echo "*                      Updating System                          *"
echo "*****************************************************************"
echo " "
yum clean all
yum repolist
yum -y update
yum -y upgrade
###########
echo " "
echo "*****************************************************************"
echo "*                      Definir Idioma                          *"
echo "*****************************************************************"
echo " "
yum -y install system-config-language
system-config-language

###########
echo " "
echo "*****************************************************************"
echo "*            Installing Tweak			              *"
echo "*****************************************************************"
echo " "

#
wget http://satya164.github.io/fedy/fedy-installer -c

chmod +x fedy-installer

sudo ./fedy-installer
#
cd /etc/yum.repos.d/
wget https://raw.github.com/kuboosoft/postinstallerf/master/postinstallerf.repo
dnf update
dnf install postinstallerf



###########
echo " "
echo "*****************************************************************"
echo "*            Installing All Plugins and Software                *"
echo "*****************************************************************"
echo " "

########### Utilities
yum -y install kernel-headers
yum -y install kernel-devel
yum -y groupinstall "Development Tools"
yum -y groupinstall "Development Libraries"
yum -y install terminator guake htop screen ccze
yum -y install dkms tzdata
yum -y install alacarte
yum -y install gnome-tweak-tool gnome-packagekit-updater gnome-gmail
yum -y install vim
yum -y install nfs-utils ntfs-3g cifs-utils
yum -y install bash-completion
yum -y install unrar p7zip p7zip-plugins
yum -y install curl wget
yum -y install cups-pdf liveusb-creator gparted nspluginwrapper alsa-plugins-pulseaudio libcurl fedora-icon-theme gconf-editor pcmanfm nemo-fileroller evince
yum -y install wine cabextract
yum -y install dropbox
yum -y install remmina.x86_64
yum -y install remmina-plugins-rdp.x86_64
yum -y install xinput_calibrator

########### Network Utilities
yum -y install bind-utils bwm-ng openssh-server ftp tcpdump nmap

########### Plugins
yum -y install flash-plugin

########### Oracle Java
#wget -c -O jre-oraclejava.rpm http://javadl.sun.com/webapps/download/AutoDL?BundleId=81811
#yum -y install jre-oraclejava.rpm
#yum -y install java java*jdk java*jdk*plugin
ln -s /usr/lib64/mozilla/plugins/libnpjp2.so /usr/lib64/mozilla/plugins/

########### Codecs/Drivers
yum -y install gstreamer1 gstreamer1-libav gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base gstreamer1-plugins-base-tools updates gstreamer1-plugins-good gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-good gstreamer-plugins-ugly libdvdcss libdvdcss libdvdnav libdvdnav libdvdread lsdvd

########### Games
yum -y install hedgewars numptyphysics gweled frozen-bubble numptyphysics five-or-more four-in-a-row gnome-chess gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-tetravex tali iagno swell-foop lightsoff quadrapassel 

########### Graphic Applications
yum -y install pinta

########### Internet/communications
#yum -y localinstall https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm 
yum -y install google-chrome-stable firefox thunderbird filezilla
yum -y install skype
yum -y install qbittorrent

########### office/readers/editors
yum -y install libreoffice  libreoffice-langpack-pt-BR gedit geany thunderbird

########### MediaPlayers
yum -y install vlc dvdrip hydrogen
yum -y install soundconverter
yum -y install rhythmbox.x86_64

 
########### PopCorn Time
yum install -y libgudev1
ln -s /usr/lib64/libgudev-1.0.so.0 /usr/lib64/libudev.so.0
#mkidr /opt/Popcorn-Time
#tar -zxvf Popcorn-Time-linux64.tar.gz -C /opt/
#ln -s /opt/Popcorn-Time /opt/popcorn-time
#chmod 775 -R /opt/Popcorn-Time /opt/popcorn-time

###########
#echo " "
#echo "*****************************************************************"
#echo "*                      Oracle VirtualBox                        *"
#echo "*****************************************************************"
#echo " "
yum -y install kernel-headers dkms gcc
#wget -c -P/etc/yum.repos.d/ http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
#echo 'skip_if_unavailable=1' >> /etc/yum.repos.d/virtualbox.repo
#yum -y install --enablerepo=virtualbox VirtualBox-4.2-?.?.*
#/etc/init.d/vboxdrv setup
###########
echo " "
echo "*****************************************************************"
echo "*                           Done!                               *"
echo "*****************************************************************"
echo " "
