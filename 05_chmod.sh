#!/bin/bash

echo "Execute file with sudo"
echo ""
echo "Indentify/secure file permissions of critical files"

chmod 644 /etc/passwd
chown root:root /etc/passwd
 
echo "/etc/passwd file is secure"

chmod 644 /etc/gshadow 
chown root:root /etc/gshadow

echo "/etc/gshadow file is secure" 

chmod 400 /etc/shadow 
chown root:root /etc/shadow
 
echo "/etc/shadow file is secure"

chmod 644 /etc/sudoers
chown root:root /etc/sudoers

echo "/etc/sudoers file is secure"

chmod 644 /etc/group
chown root:root /etc/group

echo "/etc/group file is secure"

chmod 700 /bin/ping
chmod 700 /usr/bin/who
chmod 700 /usr/bin/w
chmod 700 /usr/bin/locate 
chmod 700 /usr/bin/whereis
chmod 700 /sbin/ifconfig 
chmod 700 /bin/nano
chmod 700 /usr/bin/vi
chmod 700 /usr/bin/which
chmod 700 /usr/bin/gcc
chmod 700 /usr/bin/make
chmod 700 /usr/bin/apt-get 
chmod 700 /usr/bin/aptitude
 
echo "Misc functions have been locked to root ownership"


#New code: search for files with dogy file permissions:
