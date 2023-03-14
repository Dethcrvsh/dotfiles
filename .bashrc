#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='$(tput bold)\e[36m\W > \e[37m$(tput sgr0)'

# Import the environment variables specified in
# a separate file since they should not be source controlled
source ~/.profile

alias r='ranger'

# I can never remember the name for this program
alias screenshot='scrot'

# Alias for handling version control of the dotfiles
alias config='/usr/bin/git --git-dir=/home/dethcrvsh/dotfiles --work-tree=/home/dethcrvsh'

# Alias for copying the current path to the clipboard
alias pc='pwd | xclip -selection clipboard'

# Alias for putting a file in the trash using trash-cli
alias rm='trash-put'

alias vim='nvim'

alias server='ssh -p 5980 server@192.168.0.108'

export EDITOR=nvim
export PATH=~/.local/bin:"$PATH"

# Initialize the theme through pywal
(cat ~/.cache/wal/sequences &)

eval "$(zoxide init bash)"

neofetch
#pridefetch -f trans -w 23

alias sync="rsync -auzP -e 'ssh -p 5980' --exclude 'venv' ~/Courses/ server@192.168.0.108:~/rsync/courses/ && rsync -auzP -e 'ssh -p 5980' server@192.168.0.108:~/rsync/courses/ ~/Courses/"

alias ls='exa -l'
