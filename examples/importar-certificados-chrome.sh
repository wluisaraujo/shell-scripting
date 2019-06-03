#!/bin/bash
# w.luis.araujo@gmail.com
# Jun/2019
# public code 
# https://github.com/wluisaraujo/shell-scripting/blob/master/examples/importar-certificados-chrome.sh
# https://pastebin.com/4wuf5ybF

# testing package installed
for p in curl pki-tools 
  do 
    dpkg -l $p > /dev/null 2>&1  
    if [ $? -ne 0 ] ; then sudo apt install $p -y ; fi
  done

# Setting password
export PASSWORD=MY_CERTS_PASSWORD

# chande directory
cd /tmp

# Download certs tar file
curl -s https://s3-sa-east-1.amazonaws.com/nu-hiring-itops-exercise/certs-p12.tar -o /tmp/certs-p12.tar 2>&1

# run by happness
if [ -f /tmp/certs-p12.tar ]
  then
    tar -xf /tmp/certs-p12.tar && echo $PASSWORD > /tmp/password.key
    mkdir -p $HOME/.pki/nssdb -m 0700 && certutil -d $HOME/.pki/nssdb -N
    find /tmp/ -type f -iname '*.p12' -exec pk12util -d sql:$HOME/.pki/nssdb -w /tmp/password.key  -i {} \; && rm -f /tmp/password.key
  else
    echo 'file not found'
fi
