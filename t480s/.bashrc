#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Import the environment variables specified in
# a separate file since they should not be source controlled
source ~/.profile
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

# Start x11 if it's not active
[ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ] && exec startx;

PS1='$(tput bold)\e[36m\W > \e[37m$(tput sgr0)'
$(__git_ps1 " (%s)")

export EDITOR=nvim
export PATH=~/.local/bin:"$PATH"

alias r='ranger'
alias screenshot='scrot'

# Alias for copying the current path to the clipboard
alias pc='pwd | xclip -selection clipboard'

# Alias for putting a file in the trash using trash-cli
#alias rm='trash-put'

alias vim='nvim'
alias server='ssh -p 5980 server@dethcrvsh.com'
alias ls='exa -l --icons'
alias rm='trash-put'

# Make sure files are synced before powering off
alias poweroff='unison -batch sync && poweroff'

# Initialize the theme through pywal
(cat ~/.cache/wal/sequences &)

eval "$(zoxide init bash)"

fastfetch

