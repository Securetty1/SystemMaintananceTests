#!/bin/bash

if [ -s 'allow-guest' /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf ] 
	then 
		if [-s 'allow-guest=true' /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf ] 
			then 
				sed -i 's/allow-guest=true/allow-guest=false/' /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
		else 
			echo "Guest account has been disabled"
		fi 
	else 
		echo "allow-guest=false" >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
fi

echo "Guest account has been disabled".
