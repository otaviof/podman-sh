#
# Profile
#

export GOPATH="/go"
export PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
export PS1='${debian_chroot:+($debian_chroot)}\u :: \w \$ '

alias ls="ls --color -F"

source ~/.inputrc