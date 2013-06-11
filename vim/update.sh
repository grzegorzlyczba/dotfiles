#!/bin/bash
set -e

echo "Update Vim modules"
PURGE=0

cd `dirname $0`
if [ ! -d autoload ]; then
    mkdir autoload
fi

if [ ! -d bundle ]; then
    mkdir bundle
fi

curl -Sso autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

modules=(
    https://github.com/docunext/closetag.vim.git
    https://github.com/scrooloose/nerdtree.git
    https://github.com/scrooloose/syntastic.git
    https://github.com/Lokaltog/vim-powerline.git
    https://github.com/hced/bufkill-vim.git
    https://github.com/kien/ctrlp.vim.git
    https://github.com/majutsushi/tagbar.git
    https://github.com/tpope/vim-fugitive.git
    https://github.com/vim-scripts/hgrev.git
    https://github.com/Lokaltog/vim-distinguished.git
    https://github.com/altercation/vim-colors-solarized.git
    https://github.com/msanders/snipmate.vim.git
    https://github.com/airblade/vim-gitgutter.git
    https://github.com/jnwhiteh/vim-golang.git
    https://github.com/Lokaltog/vim-distinguished
    https://github.com/bronson/vim-trailing-whitespace.git
)

for module in ${modules[@]}; do
	dirname=$(basename $module | cut -d '.' -f 1)
    echo ${dirname}
	if [ $PURGE -ne 0 ]; then
		rm -rf bundle/${dirname}
	fi 

	if [ -d bundle/${dirname} ]; then
		cd bundle/${dirname}
		git pull
		cd  - >/dev/null
	else
		git clone $module bundle/${dirname}
	fi
done
