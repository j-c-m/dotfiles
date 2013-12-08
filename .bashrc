[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f "${HOME}/.bash_prompt" ]; then
    source "${HOME}/.bash_prompt"
fi

if [ -f "${HOME}/.bash_aliases" ]; then
    source "${HOME}/.bash_aliases"
fi

# Set MANPATH so it includes users' private man if it exists
if [ -d "${HOME}/man" ]; then
   export MANPATH=${HOME}/man:${MANPATH}
fi

if [ $(type -P vim) ]; then
    export EDITOR=vim
    export VISUAL=vim
elif [ $(type -P ee) ]; then
    export EDITOR=ee
    export VISUAL=ee
fi
