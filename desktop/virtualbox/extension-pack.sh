#!/bin/bash


yum groupinstall -y 'Development Tools' SDL kernel-devel kernel-headers dkms

# Install the key just downloaded.

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc

rpm --import oracle_vbox.asc

# Update and Install Virtualbox.

yum update && yum install virtualbox-4.3

# Next, download and install Virtualbox extension pack.
wget -O OracleVirutalBox.vbox-extpack http://download.virtualbox.org/virtualbox/4.3.12/Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack

VBoxManage extpack install OracleVirutalBox.vbox-extpack

# 

gpasswd -a wluisaraujo vboxusers


