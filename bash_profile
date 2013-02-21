if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
[[ -s /home/developer/.nvm/nvm.sh ]] && . /home/developer/.nvm/nvm.sh # This loads NVM
export PATH=~/tools/bin:~/tools/node_modules/.bin:$PATH
