#!/bin/bash
cd $(dirname $0)
DIR=$(pwd)

npm_packages=(
	jsctags
	jshint
)

for x in $(ls | grep -v `basename $0`); do
	if [ ! -h ~/.${x} ]; then
		ln -s $DIR/$x ~/.${x}
	fi
done

mkdir -p  ~/tools/{node_modules,bin}
cd ~/tools
for package in ${npm_packages[@]}; do
	npm install $package
done
cd -
./vim/update.sh
