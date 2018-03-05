#!/bin/bash

echo "Indentify/secure file permissions of critical files"
echo""

sudo chmod 644 /etc/passwd
sudo chown root:root /etc/passwd
 
echo "/etc/passwd file is secure"
echo ""

sudo chmod 644 /etc/gshadow 
sudo chown root:root /etc/gshadow

echo "/etc/gshadow file is secure" 
echo ""

sudo chmod 400 /etc/shadow 
sudo chown root:root /etc/shadow
 
echo "/etc/shadow file is secure"
echo ""

sudo chmod 644 /etc/sudoers
sudo chown root:root /etc/sudoers

echo "/etc/sudoers file is secure"
echo ""

sudo chmod 644 /etc/group
sudo chown root:root /etc/group

echo "/etc/group file is secure"
echo ""

sudo chmod 700 /bin/ping
sudo chmod 700 /usr/bin/who
sudo chmod 700 /usr/bin/w
sudo chmod 700 /usr/bin/locate 
sudo chmod 700 /usr/bin/whereis
sudo chmod 700 /sbin/ifconfig 
sudo chmod 700 /bin/nano
sudo chmod 700 /usr/bin/vi
sudo chmod 700 /usr/bin/which
sudo chmod 700 /usr/bin/gcc
sudo chmod 700 /usr/bin/make
sudo chmod 700 /usr/bin/apt-get 
sudo chmod 700 /usr/bin/aptitude
 
echo "Misc functions have been locked to root ownership"


#New code: search for files with dogy file permissions:
