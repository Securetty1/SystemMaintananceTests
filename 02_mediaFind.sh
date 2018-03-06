#!/bin/bash

###Comments were left in for debugging

files=(~/results/mediaFoundtmp.txt ~/results/02_mediaFound.txt)
mediaA=('.3gp' '.aa' '.aac' '.aax' '.act' '.aiff' '.amr' '.ape' '.au' '.awb' '.dct' '.dss' '.dvf' '.flac' '.gsm' '.iklax' '.ivs' '.m4a' '.m4b' '.m4p' '.mmf' '.mp3' '.mpc' '.msv' '.mogg' '.opus' '.sln' '.ra' '.raw' '.tta' '.vox' '.wav' '.wma' '.wv')
mediaV=('.webm' '.mkv' '.flv' '.vob' '.ogv' '.ogg' '.drc' '.gif' '.mng' '.avi' '.mov' '.qt' '.wmv' '.yuv' '.rm' '.asf' '.amv' '.mp4' '.m4p' '.m4v' '.mpg' '.mp2' '.mpeg' '.mpe' '.mpv' '.m2v' '.m4v' '.svi' '.3gp' '.3g2' '.mxf' '.roq' '.nsv' '.f4v' '.f4p' '.f4a' '.f4b')
mediaD=('.doc' '.docx' '.ppt' '.pptx' '.xls' '.xlsx' '.pdf' '.odt' '.ods' '.odp' '.odg' '.odf' '.xml' '.sxw' '.sxi' '.sxc' '.sxd' '.stw')
mediaI=('.jpg' '.png' '.webp' '.svg' '.ai' '.eps' '.jpeg' '.jiff' '.jpe')

echo "Search only '/home' [y/n]?"
read fP

#If no path is given set it to /
if [ -z $fP ] ; then
	fP=n
fi

#Checks for path
if [ $fP = "y" ] ; then
	usePath=/home
else
	usePath=/
fi

#echo $usePath

echo "Find Audio [y/n]?"
read fA

echo "Find Video [y/n]?"
read fV

echo "Find Documents [y/n]? (HTML and Text documents are excluded)"
read fD

#echo "Find Executables [y/n]?"
#read fE

echo "Find Images [y/n]?"
read fI

###If no arguments were given then search for everything
if [ -z $fA ] ; then
	fA=y
fi
if [ -z $fV ] ; then
	fV=y
fi
if [ -z $fD ] ; then
	fD=y
fi
if [ -z $fI ] ; then
	fI=y
fi

###Add code that checks if the script is running in the background and if yes check for everything.
#if [ "running in background" ] ; then
#	$fA=y
#	$fV=y
#	$fD=y
#	$fE=y
#	$fI=y
#fi

#Finds Audio files on the system and outputs them to $file. It then sorts the $file so each file is listen only once.
if [ $fA = "y" ] ; then
	echo "Audio Files:" > ${files[1]}
#	echo ${#mediaA[@]}
	for i in `seq 1 ${#mediaA[@]}` ; do
		let N=i-1
#		echo $N
#		echo ${mediaA[N]}
		sudo find $usePath -name *${mediaA[N]} 2>/dev/null >> $files
	done

	sort -u $files >> ${files[1]}
	echo "" >> ${files[1]}
	echo "Audio files can be found in ${files[1]}"
fi

#exit

#Finds Video files on the system and outputs them to $file. It then sorts the $file so each file is only listed once.
if [ $fV = "y" ] ; then
	echo "Video Files:" >> ${files[1]}
	for i in `seq 1 ${#mediaV[@]}` ; do
		let N=i-1
		sudo find $usePath -name *${mediaV[N]} 2>/dev/null >> $files
	done

	sort -u $files >> ${files[1]}
	echo "" >> ${files[1]}
	echo "Video files can be found in ${files[1]}"
fi

#Finds Document files on the system and outputs them to $file. It then sorts the $file so each file is only listed once.
if [ $fD = "y" ] ; then
	echo "Document Files:" >> ${files[1]}
	for i in `seq 1 ${#mediaD[@]}` ; do
		let N=i-1
		sudo find $usePath -name *${mediaD[N]} 2>/dev/null >> $files
	done

	sort -u $files >> ${files[1]}
	echo "" >> ${files[1]}
	echo "Document files can be found in ${files[1]}"
fi

#Finds Executable files on the system and outputs them to $file. It then sorts the $file so each file is only listed once.
#if [ $fE = "y" ] ; then
#	echo "Executable Files:" >> ${files[1]}
#	sudo find $usePath -perm 2000 2>/dev/null >> $files
##	sort -u $files >> ${files[1]}
#	echo "" >> ${files[1]}
#	echo "Executables can be found in ${files[1]}"
#fi

#Finds Image files on the system and outputs them to $file. It then sorts the $file so each file is only listed once.
if [ $fI = "y" ] ; then
	echo "Image Files:" >> ${files[1]}
	for i in `seq 1 ${#mediaI[@]}` ; do
		let N=i-1
		sudo find $usePath -name *${mediaI[N]} 2>/dev/null >> $files
	done

	sort -u $files >> ${files[1]}
	echo "" >> ${files[1]}
	echo "Image files can be found in ${files[1]}"
fi

rm $files
