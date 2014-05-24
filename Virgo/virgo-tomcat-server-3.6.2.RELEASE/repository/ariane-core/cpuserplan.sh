#!/bin/bash

usage() {
	echo "usage $0 reference_user_name"
	exit
}

if [ $# != "1" ]; then
	usage
fi

for file in `ls *.$1`
do
	target=`echo $file | sed "s/$1/$USER/g"`
	cp $file $target

	sed -i "s/$1/$USER/g" $target
done
