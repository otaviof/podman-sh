# .bashrc

set -o vi

export GOPATH="/go"
export PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
export PS1='${debian_chroot:+($debian_chroot)}\u :: \w \$ '

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color -F'

[[ -f "~/.inputrc" ]] && \
    source ~/.inputrc

[[ -f "/etc/bashrc" ]] && \
    source /etc/bashrc

[[ -d "~/.bash.d" ]] && \
    source ~/.bash.d/*.sh

[[ -f "~/.profile" ]] && \
    source ~/.profile
