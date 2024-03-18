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
export PATH=~/.cargo/bin:"$PATH"

x () {
    if [ -f "$1" ] ; then
    case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    tar xf $1    ;;
        *.tar.zst)   unzstd $1    ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias r='ranger'
alias screenshot='scrot'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'

# Alias for copying the current path to the clipboard
alias pc='pwd | xclip -selection clipboard'

# Alias for putting a file in the trash using trash-cli
alias vim='nvim'
alias server='ssh -p 5980 server@dethcrvsh.com'
alias ls='exa -l --icons'
alias rm='trash-put'
alias ssh-liu='ssh -XY fabjo285@ssh.edu.liu.se'

# Make sure files are synced before powering off
alias poweroff='unison -batch sync && poweroff'

# Initialize the theme through pywal
(cat ~/.cache/wal/sequences &)

eval "$(zoxide init bash)"

fastfetch

