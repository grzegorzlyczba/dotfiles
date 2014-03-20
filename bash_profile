if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh # This loads NVM

export GOROOT=/usr/local/go
export PATH=~/tools/bin:~/tools/node_modules/.bin:$GOROOT/bin:$PATH

SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | \
    cut -f 1 -d " " | \sed -e s/,.*//g | \
    uniq ) )
complete -o default -W "${SSH_COMPLETE[*]}" ssh


alias vim='vim -p'

export TERM="xterm-256color"
