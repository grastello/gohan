# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Use liquidprompt!
source $HOME/gohan/bash/liquidprompt

# Enable color support for some commands.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Aliases.
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias nw='newsboat'

# Vi mode.
set -o vi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Load rust tools.
. "$HOME/.cargo/env"
