#!/bin/bash

echo "Type '32' to find 32-bit processes"
read bit
bit=$bit'-bit'
files=(~/results/processesFoundtmp.txt ~/results/04_processesFound.txt)

sudo find /proc -name exe | xargs readlink | xargs file | grep $bit 2>/dev/null > $file

if [ $? != 0 ] ; then
	echo "No $bit processes found"
else
	cat $files | grep . | awk -F ":" '{print $1":"}' > ${files[1]}
	echo "Found processe are located in ${files[1]}"
fi

rm $files
