#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias r='ranger'

# I can never remember the name for this program
alias screenshot='scrot'

PS1='\e[36m\W > \e[37m'

export EDITOR=nvim
export PATH=~/.local/bin:"$PATH"

# Initialize the theme through pywal
(cat ~/.cache/wal/sequences &)

# Alias for handling version control of the dotfiles
alias config='/usr/bin/git --git-dir=/home/dethcrvsh/dotfiles --work-tree=/home/dethcrvsh'

eval "$(zoxide init bash)"

# Alias for copying the current path to the clipboard
alias pc='pwd | xclip -selection clipboard'

# Alias for putting a file in the trash using trash-cli
alias rm='trash-put'

neofetch
