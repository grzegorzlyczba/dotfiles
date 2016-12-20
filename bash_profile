if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh # This loads NVM

export GOROOT=/usr/local/opt/go/libexec/
export GOPATH=/Users/glyczba/projects/goworkspace
export PATH=~/tools/bin:~/tools/node_modules/.bin:$GOROOT/bin:$GOPATH/bin:$PATH

SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | \
    cut -f 1 -d " " | \sed -e s/,.*//g | \
    uniq ) )
complete -o default -W "${SSH_COMPLETE[*]}" ssh


alias vim='vim -p'
alias sl=ls

export TERM="xterm-256color"
export PYTHONPATH=.:./lib
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

function prompt_callback {
    if hash kubectl 2>/dev/null; then
        echo -n " kubectl:$(kubectl config current-context)"
    fi
}


# kubectl config current-context
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
