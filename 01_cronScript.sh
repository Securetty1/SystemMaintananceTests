#!/bin/bash

###Comments in the code were used for debugging purposes
#The date and time are included in the file as well as the new scans appended (instead of overwriting the existing file)
#in order to log activities.

files=(~/results/01_crontabsFound.txt)

#Creates an arrya containing all users to find crontabs for. It also 'id's them to see if the users exists - typo-proof.
echo "Enter users separated by spaces"
read -a usrArray
#echo ${usrArray[@]}
for r in `seq 1 ${#usrArray[@]}` ; do
#	echo $r
	let m=r-1
#	echo $m
#	echo ${usrArray[r]}
#	echo ${usrArray[m]}
#	id ${usrArray[r]}
#	echo $?
#	id ${usrArray[$r]} >> /dev/null
#	echo $?
	id ${usrArray[r]} 2>/dev/null 1>/dev/null
	if [ $? != 0 ] ; then
		echo "No such user. Try again"
		exit
	else
		continue
	fi
done
#echo "done"
#echo "${usrArray[@]}"

date >> $files
echo "" >> $files

#Checks crontabs for each user in the 'usrArray'.
for i in `seq 1 ${#usrArray[@]}` ; do
	let N=i-1
	sudo crontab -u ${usrArray[N]} -l 2>/dev/null 1>/dev/null
	if [ $? != 0 ] ; then
		echo "No crontabs for ${usrArray[N]}"
	else
		echo "${usrArray[N]}" >> $files
		echo "Running crontabs for ${usrArray[N]}"
	fi
done

echo "--------------" >> $files
echo "The users who have running crontabs can be found in $files"
