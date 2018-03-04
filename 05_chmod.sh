#!/bin/bash

echo "Identifying file permissions of critical files"

chmod 640 /etc/passwd
chown root /etc/passwd
chgrp root /etc/passwd
 
echo "Password file was and is secure"

chmod 640 /etc/gshadow 
chown root /etc/gshadow
chgrp shadow /etc/gshadow

echo "Gshadow file was and is secure" 

chmod 640 /etc/shadow 
chown root /etc/shadow
chgrp shadow /etc/shadow
 
echo "Shadow file was and is secure"

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
