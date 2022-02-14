#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias r='ranger'

PS1='\W > '

export EDITOR=nvim

# Initialize the theme through pywal
wal -R -e -n > /dev/null 2>&1

# Alias for handling version control of the dotfiles
alias config='/usr/bin/git --git-dir=/home/dethcrvsh/dotfiles --work-tree=/home/dethcrvsh'

neofetch
