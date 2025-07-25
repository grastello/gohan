# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Personal prompt
PS1="\[\033[00;37m\]\$(exit=\$?; if [[ \$exit != 0 ]]; then echo \"\[\033[00;31m\]X \$exit \"; fi)\[\033[00;32m\]\u\[\033[00;36m\] \W \[\033[00;31m\]\$(parse_git_branch)\[\033[00;32m\]\$\[\033[00m\] "

# get current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d;s/* /[/;s/$/] /'
}

# Default editor.
export EDITOR='kak'
export GIT_EDITOR='kak'

# Coreutils aliases.
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Non-coreutils software aliases.
alias nw='newsboat'
alias nnn='nnn -A -d'

# Navigation aliases.
alias teach='cd $HOME/documents/projects/teaching'
alias vid="nnn -A -d ${HOME}/videos"
alias books="nnn -A -d ${HOME}/documents/resources/books"
alias todo="${EDITOR} ${HOME}/TODO.md"

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
