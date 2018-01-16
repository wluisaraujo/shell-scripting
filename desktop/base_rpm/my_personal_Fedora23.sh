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
dnf -y update
dnf -y upgrade
###########
echo " "
echo "*****************************************************************"
echo "*                  Installing Repositories                      *"
echo "*****************************************************************"
echo " "
## Repositório RPMfusion Free
dnf -y install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
## Repositório RPMfusion Nonfree
dnf -y install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
## Repositórios Russian Fedora Free
http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/fedora/russianfedora-free-release-stable.noarch.rpm -y
## Repositórios Russian Fedora NonFree
dnf -y install http://mirror.yandex.ru/fedora/russianfedora/russianfedora/nonfree/fedora/russianfedora-nonfree-release-stable.noarch.rpm -y
## Repositório Adobe
dnf -y install --nogpgcheck http://linuxdownload.adobe.com/linux/$(uname -m)/adobe-release-$(uname -m)-1.0-1.noarch.rpm
## Repositório Wine
dnf -y install http://sourceforge.net/projects/postinstaller/files/fedora/releases/21/x86_64/winetricks-20130919-1.fc21.noarch.rpm/download
## Codecs for reading some encrypted DVDs
rpm -ivh http://rpm.livna.org/livna-release.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-livna
## Repositorio Google
#dnf -y localinstall --nogpgcheck https://dl.google.com/linux/direct/google-chrome-stable_current_$(uname -m).rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
##
echo " "
echo "*****************************************************************"
echo "*                Installing Google Repository                   *"
echo "*****************************************************************"
echo " "

cat << EOF > /etc/dnf.repos.d/google-chrome.repo
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
dnf clean all
dnf repolist
dnf -y update
dnf -y upgrade
###########
echo " "
echo "*****************************************************************"
echo "*                      Definir Idioma                          *"
echo "*****************************************************************"
echo " "
dnf -y install system-config-language
system-config-language

###########
echo " "
echo "*****************************************************************"
echo "*            Installing Tweak			              *"
echo "*****************************************************************"
echo " "

############ Fedy

wget http://satya164.github.io/fedy/fedy-installer -c

chmod +x fedy-installer

sudo ./fedy-installer

############ PostInstallerF

#cd /etc/dnf.repos.d/
wget https://raw.github.com/kuboosoft/postinstallerf/master/postinstallerf.repo -O /etc/dnf.repos.d/postinstallerf.repo
dnf update
dnf install postinstallerf



###########
echo " "
echo "*****************************************************************"
echo "*            Installing All Plugins and Software                *"
echo "*****************************************************************"
echo " "

########### Utilities
dnf -y install kernel-headers kernel-devel
dnf -y groupinstall "Development Tools"
dnf -y groupinstall "Development Libraries"
dnf -y install vim bash-completion terminator guake htop screen ccze dkms tzdata
dnf -y install gnome-tweak-tool gnome-packagekit-updater gnome-gmail
dnf -y install nfs-utils ntfs-3g cifs-utils
dnf -y install unrar p7zip p7zip-plugins curl wget libcurl fedora-icon-theme
dnf -y install remmina.x86_64 remmina-plugins-rdp.x86_64
########### Network Utilities
dnf -y install bind-utils bwm-ng openssh-server ftp tcpdump nmap

########### Plugins
dnf -y install flash-plugin

########### Oracle Java
#wget -c -O jre-oraclejava.rpm http://javadl.sun.com/webapps/download/AutoDL?BundleId=81811
#dnf -y install jre-oraclejava.rpm
#dnf -y install java java*jdk java*jdk*plugin
ln -s /usr/lib64/mozilla/plugins/libnpjp2.so /usr/lib64/mozilla/plugins/

########### Codecs/Drivers
dnf -y install gstreamer1 gstreamer1-libav gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base gstreamer1-plugins-base-tools updates gstreamer1-plugins-good gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-good gstreamer-plugins-ugly libdvdcss libdvdcss libdvdnav libdvdnav libdvdread lsdvd

########### Games
dnf -y install hedgewars numptyphysics gweled frozen-bubble numptyphysics five-or-more four-in-a-row gnome-chess gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-tetravex tali iagno swell-foop lightsoff quadrapassel 

########### Graphic Applications
dnf -y install pinta

########### Internet/communications
#dnf -y localinstall https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm 
dnf -y install google-chrome-stable firefox thunderbird filezilla
dnf -y install skype
dnf -y install qbittorrent

########### office/readers/editors
dnf -y install libreoffice  libreoffice-langpack-pt-BR gedit geany thunderbird

########### MediaPlayers
dnf -y install vlc dvdrip hydrogen
dnf -y install soundconverter
dnf -y install rhythmbox.x86_64

 
########### PopCorn Time
dnf install -y libgudev1
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
dnf -y install kernel-headers dkms gcc
#wget -c -P/etc/dnf.repos.d/ http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
#echo 'skip_if_unavailable=1' >> /etc/dnf.repos.d/virtualbox.repo
#dnf -y install --enablerepo=virtualbox VirtualBox-4.2-?.?.*
#/etc/init.d/vboxdrv setup
###########
echo " "
echo "*****************************************************************"
echo "*                           Done!                               *"
echo "*****************************************************************"
echo " "
