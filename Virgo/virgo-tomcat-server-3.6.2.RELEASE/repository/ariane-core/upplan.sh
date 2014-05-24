#!/bin/bash

usage() {
	echo "usage $0 source_version target_version"
	exit
}

if [ $# != "2" ]; then
	usage
fi

for file in `ls *$1.plan*`
do
	target=`echo $file | sed "s/$1/$2/g"`
	mv $file $target

	sed -i "s/$1/$2/g" $target
done
