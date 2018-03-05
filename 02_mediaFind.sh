#!/bin/bash

files=(~/results/mediaFoundtmp.txt ~/results/02_mediaFound.txt)
mediaA=('.3gp' '.aa' '.aac' '.aax' '.act' '.aiff' '.amr' '.ape' '.au' '.awb' '.dct' '.dss' '.dvf' '.flac' '.gsm' '.iklax' '.ivs' '.m4a' '.m4b' '.m4p' '.mmf' '.mp3' '.mpc' '.msv' '.mogg' '.opus' '.sln' '.ra' '.raw' '.tta' '.vox' '.wav' '.wma' '.wv')
mediaV=('.webm' '.mkv' '.flv' '.vob' '.ogv' '.ogg' '.drc' '.gif' '.mng' '.avi' '.mov' '.qt' '.wmv' '.yuv' '.rm' '.asf' '.amv' '.mp4' '.m4p' '.m4v' '.mpg' '.mp2' '.mpeg' '.mpe' '.mpv' '.m2v' '.m4v' '.svi' '.3gp' '.3g2' '.mxf' '.roq' '.nsv' '.f4v' '.f4p' '.f4a' '.f4b')
mediaD=('.doc' '.docx' '.ppt' '.pptx' '.xls' '.xlsx' '.pdf' '.odt' '.ods' '.odp' '.odg' '.odf' '.xml' '.sxw' '.sxi' '.sxc' '.sxd' '.stw')
mediaI=('.jpg' '.png' '.webp' '.svg' '.ai' '.eps' '.jpeg' '.jiff' '.jpe')

echo "Search only '/home' [y/n]?"
read fP
if [ $fP = "y" ] ; then
	usePath=/home
else
	usePath=/
fi

echo $usePath

echo "Find Audio [y/n]?"
read fA

echo "Find Video [y/n]?"
read fV

echo "Find Documents [y/n]? (HTML and Text documents are excluded)"
read fD

echo "Find Executables [y/n]?"
read fE

echo "Find Images [y/n]?"
read fI

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
	echo "Audio Files:" > $files
	for i in `seq 1 ${#mediaA[@]}` ; do
		let N=i-1
		sudo find $usePath -name '*${mediaA[N]}' 2>/dev/null >> $files
	done

	sort -u $files > ${files[1]}
	echo "" >> ${files[1]}
	echo "Found Audio files can be found in ${files[1]}"
fi

#Finds Video files on the system and outputs them to $file. It then sorts the $file so each file is only listed once.
if [ $fV = "y" ] ; then
	echo "Video Files:" > $files
	for i in `seq 1 ${#mediaV[@]}` ; do
		let N=i-1
		sudo find $usePath -name '*${mediaV[N]}' 2>/dev/null >> $files
	done

	sort -u $files >> ${files[1]}
	echo "" >> ${files[1]}
	echo "Found Video files can be found in ${files[1]}"
fi

#Finds Document files on the system and outputs them to $file. It then sorts the $file so each file is only listed once.
if [ $fD = "y" ] ; then
	echo "Document Files:" > $files
	for i in `seq 1 ${#mediaD[@]}` ; do
		let N=i-1
		sudo find $usePath -name '*${mediaD[N]}' 2>/dev/null >> $files
	done

	sort -u $files >> ${files[1]}
	echo "" >> ${files[1]}
	echo "Found Document files can be found in ${files[1]}"
fi

#Finds Executable files on the system and outputs them to $file. It then sorts the $file so each file is only listed once.
#if [ $fE = "y" ] ; then
#	echo "Executable Files:" > $files
#	for i in `seq 1 ${#mediaE[@]}` ; do
#		let N=i-1
#		sudo find $usePath -name '*${mediaE[N]}' 2>/dev/null >> $files
#	done
#
#	sort -u $files >> ${files[1]}
#	echo "" >> ${files[1]}
#	echo "Found Executables can be found in ${files[1]}"
#fi

#Finds Image files on the system and outputs them to $file. It then sorts the $file so each file is only listed once.
if [ $fI = "y" ] ; then
	echo "Image Files:" > $files
	for i in `seq 1 ${#mediaI[@]}` ; do
		let N=i-1
		sudo find $usePath -name '*${mediaI[N]}' 2>/dev/null >> $files
	done

	sort -u $files >> ${files[1]}
	echo "" >> ${files[1]}
	echo "Found Images can be found in ${files[1]}"
fi

rm $files
