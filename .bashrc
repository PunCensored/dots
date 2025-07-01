#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '



 ###########
## Aliases ##
 ##########

alias qq="exit"
alias cc="clear"
alias up="yay -Syyu && sudo pacman -Syu"


# Created by `pipx` on 2025-06-27 17:12:01
export PATH="$PATH:/home/puncensored/.local/bin"
