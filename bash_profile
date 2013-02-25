if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh # This loads NVM
export PATH=~/tools/bin:~/tools/node_modules/.bin:$PATH
