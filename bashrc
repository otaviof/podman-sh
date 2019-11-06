# .bashrc

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color -F'

[[ -f /etc/bashrc ]] && source /etc/bashrc
[[ -d ~/.bash.d ]] && source ~/.bash.d/*.sh
[[ -f ~/.profile ]] && source ~/.profile
