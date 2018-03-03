#!/bin/bash

###Comments in the code were used for debugging purposes

file=~/02_crontabFound.txt
echo "Enter the number of users"
read usrNum

echo "Enter users separated by spaces"
read -a usrArray
for r in `seq 1 ${#usrArray[@]}` ; do
#	echo $r
	let m=$r-1
#	echo $m
#	echo ${usrArray[r]}
#	echo ${usrArray[m]}
#	id ${usrArray[r]}
#	echo $?
#	id ${usrArray[$r]} >> /dev/null
#	echo $?
	id ${usrArray[r]} 2>/dev/null >> /dev/null
	if [ $? != 0 ] ; then
		echo "No such user. Try again"
		exit
	else
		continue
	fi
done
#echo "done"

for i in `seq 1 ${#usrArray[@]}` ; do
	let N=i-1
	sudo crontab -u ${usrArray[N]} -l 2>/dev/null >> /dev/null
	if [ $? != 0 ] ; then
		echo "No crontabs for ${usrArray[N]}"
	else
		sudo crontab -u ${usrArray[N]} -l >> $file
		echo "" >> $file
	fi
done
