#!/bin/bash

files=(~/results/03_foundBadPackages.txt ~/results/03_foundServicePackages.txt ~/results/03_packagesRemoved.txt ~/results/foundBadtmp.txt ~/results/foundUsefultmp.txt ~/results/03_notFound.txt)
#The 'aPackage' array contains packages which you don't want to have on your system. These can be exact package names as well as keywords.
aPackages=('hydra' 'medusa' 'netcat-traditional' 'netcat-openbsd' 'nmap' '-ng' 'netdiscover' 'nikto' 'golismero' 'maltego' 'sparta' 'lynis' 'burpsuit' 'commix' 'httrack' 'john' 'ophcrack' 'cewl' 'sploit' 'attack' 'armitage' 'beef' 'backdoor' 'wireshark')
#The 'bPackages' array contains packages you may want to install. The have to be exact package names that apt can recognise.
bPackages=('rkhunter' 'chkrootkit' 'slay' 'libpam-cracklib' 'iptables' 'firefox-esr' 'auditd' 'sudo' 'denyhosts' 'fail2ban' 'clamav')
#The 'cPackages' array contains packages you may want to use.
cPackages=('samba' 'apache' 'ssh' 'bind9' 'sql' 'nginx' 'postgre' 'ftp' 'telnet')

#if [ -e ${files[@]} ] ; then
	rm ${files[@]}
#fi

for i in `seq 1 ${#bPackages[@]}` ; do
	let N=i-1
	echo "Install ${bPackages[N]}? [y/n]"
	read inY
	echo ""
	if [ $inY = "y" ] ; then
		sudo apt install ${bPackages[N]} 2>/dev/null 1>/dev/null
		if [ $? = 0 ] ; then
			echo "${bPackages[N]} has been installed and updated"
			echo ""
		else
			echo "Error installing ${bPackages[N]} :/"
			echo ""
		fi
	else
		echo "${bPackages[N]} was not installed"
		echo ""
	fi
done

echo ""
echo "Enable ufw [y/n]?"
read enU
echo ""
if [ $enU = "y" ] ; then
	echo "Installing and enabling ufw"
	echo ""
	sudo apt install ufw 2>/dev/null 1>/dev/null
	sudo ufw enable 2>/dev/null 1>/dev/null
	if [ $? = 0 ] ; then
		echo "ufw enabled!"
		echo ""
	else
		echo "Error enabling ufw :/"
		echo ""
	fi
fi

echo "Finding bad packages"
echo ""
for i in `seq 1 ${#aPackages[@]}` ; do
	let N=i-1
	apt list --installed | grep ${aPackages[N]} 2>/dev/null >> ${files[3]}
	cat ${files[3]} | awk -F'/ ''{print $1}' >> $files
done
rm ${files[3]}
echo "Packages you may want to remove can be found in $files"

#exit

echo "Remove bad packages? [y/n]"
read rmP
echo ""
numP=$( wc -l $files )

if [ $rmP = 'y' ] ; then
	for line in `seq 1 $numP` ; do
		package=$( cat $files | head -$line | tail -1 )
		echo "Remove $package [y/n]?"
		read rmY
		echo ""
		if [ $rmY = "y" ] ; then
			$package >> ${files[2]}
			sudo apt purge $package 1>/dev/null 2>/dev/null
			if [ $? = 0 ] ; then
				echo "$package removed"
				echo ""
			else
				echo "Error removing $package :/"
				echo ""
			fi
		fi
	done
fi

echo "Finding extra packages"
echo ""
echo "Note that entries in this file may not be exact package names but rather keywords" > ${file[5]}
for i in `seq 1 ${#cPackages[@]}` ; do
	let N=i-1
	apt list --installed | grep ${cPackages[N]} 2>/dev/null >> ${files[4]}
	if [ $? != 0 ] ; then
		${cPackages[N]} >> ${files[5]}
	fi
	cat ${files[4]} | awk -F'/' '{print $1}' >> ${files[1]}
done
rm ${files[4]}
echo "Extra packages installed can be found in ${files[1]}"
echo "Extra packages not installed that you may want can be found in ${file[5]}"
echo ""

#exit

echo "Do you want to Remove any extra packages [y/n]?"
read iR
echo ""
numE=$( wc -l ${files[1]} )

if [ $iR = 'y' ] ; then
	for i in `seq 1 $numE` ; do
		package=$( cat ${files[1]} | head -$numE | tail -1 )
		echo "Remove $package [y/n]?"
		read irY
		echo ""
		if [ $irY = "y" ] ; then
			sudo apt purge $package 1>/dev/null 2>/dev/null
			if [ $? = 0 ] ; then
				$package >> ${files[2]}
				echo "$package removed"
				echo ""
			else
				echo "Error removing $package"
				echo ""
			fi
		fi
	done
fi
