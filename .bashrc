#
# ~/.bashrc
#

alias la='ls -a'
alias ll='ls -lh'
alias lal='ls -alh'
alias ls='ls --color=auto'
alias view='vim -R'

set -o vi
export EDITOR="vim"

PS1="\[$(tput setaf 8)\][\[$(tput setaf 2)\]\u\[$(tput setaf 8)\]@\[$(tput setaf 2)\]\h \[$(tput bold)\]\[$(tput setaf 4)\]\w\[$(tput sgr0)\]\[$(tput setaf 8)\]]\\$ \[$(tput sgr0)\]"

