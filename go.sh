#!/bin/bash
cd $(dirname $0)
DIR=$(pwd)

for x in $(ls | grep -v `basename $0`); do
	if [ ! -h ~/.${x} ]; then
		ln -s $DIR/$x ~/.${x}
	fi
done

./vim/update.sh
