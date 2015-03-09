#!/bin/bash
set -e

cd `dirname $0`
if [ ! -d autoload ]; then
    mkdir autoload
fi

if [ ! -d bundle ]; then
    mkdir bundle
fi

echo "Clone Vundle"

git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim
