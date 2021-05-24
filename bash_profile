if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias vim=nvim
alias sl=ls


export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=${HOME}/misc/bin/:$PATH

if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi


function _update_ps1() {
    PS1="$(/usr/local/bin/powerline-go -modules time,perms,kube,cwd,git,jobs,exit,root -cwd-mode dironly -shorten-gke-names -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "/usr/local/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# pyenv
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


export GOPRIVATE=github.com/openx
export EDITOR=/usr/local/bin/nvim
export GOPATH=${HOME}/go
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


export CLOUDSDK_PYTHON=python2

. /usr/local/opt/asdf/asdf.sh
. /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
. /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc

## perl modules
eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

## openssl via homebrew workaround
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
