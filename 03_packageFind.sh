#!/bin/bash

files=(~/results/03_foundBadPackages.txt ~/results/03_foundServerPackages ~/results/03_packagesRemoved ~/results/foundBadtmp.txt ~/results/foundUsefultmp.txt)
#The 'aPackage' array contains packages which you don't want to have on your system. These can be exact package names as well as keywords.
aPackages=('hydra' 'medusa' 'netcat' 'nmap' '-ng' 'netdiscover' 'nikto' 'golismero' 'maltego' 'sparta' 'lynis' 'burpsuit' 'commix' 'httrack' 'john' 'ophcrack' 'cewl' 'sploit' 'attack' 'armitage' 'beef' 'backdoor' 'wireshark')
#The 'bPackages' array contains packages you may want to install. The have to be exact package names that apt can recognise.
bPackages=('rkhunter' 'chkrootkit' 'slay' 'libpam-cracklib' 'iptables' 'firefox-esr' 'auditd' 'sudo')
#The 'cPackages' array contains packages you may want to use.
cPackages=('samba' 'apache' 'ssh' 'bind9' 'sql' 'nginx' 'postgre' 'ftp' 'telnet')

if [ -e ${files[@]} ] ; then
	rm ${files[@]}
fi

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
	dpkg --list | grep ${aPackages[N]} 2>/dev/null >> ${files[3]}
	cat ${files[3]} | awk '{print $2}' >> $files
done
rm ${files[3]}
echo "Packages you may want to remove can be found in $files"

echo "Remove bad packages [y/n]?"
read rmP
echo ""
numP=$( wc -l $files )
let numP=$(( $numP-1 ))

if [ $rmP = 'y' ] ; then
	for i in `seq 1 $numP` ; do
		let N=i-1
		let M=i+1
		package=$( cat $files | head -$M | tail -1 )
		echo "Remove $package [y/n]?"
		read rmY
		echo ""
		if [ $rmY = "y" ] ; then
			$package >> ${files[2]}
			sudo apt purge $package
			if [ $? = 0 ] ; then
				echo "$package removed"
				echo ""
			else
				echo "Error removing $package"
				echo ""
			fi
		fi
	done
fi

echo "Finding useful packages"
echo ""
for i in `seq 1 ${#cPackages[@]}` ; do
	let N=i-1
	dpkg --list | grep ${cPackages[N]} 2>/dev/null >> ${files[4]}
	cat ${files[4]} | awk '{print $2}' >> ${files[1]}
done
rm ${files[4]}
echo "Packages you may want can be found in ${files[1]}"
echo ""

echo "Do you want to Install/Remove any extra packages [i/r]?"
read iR
echo ""
numE=$( wc -l ${files[1]} )
let numE=$(( $numE-1 ))

if [ $iR = 'y' ] ; then
	for i in `seq 1 $numE` ; do
		let N=i-1
		let M=i+1
		package=$( cat ${files[1]} | head -$M | tail -1 )
		echo "Remove $package [y/n]?"
		read irY
		echo ""
		if [ $irY = "y" ] ; then
			$package >> ${files[2]}
			sudo apt purge $package
			if [ $? = 0 ] ; then
				echo "$package removed"
				echo ""
			else
				echo "Error removing $package"
				echo ""
			fi
		fi
	done
fi

