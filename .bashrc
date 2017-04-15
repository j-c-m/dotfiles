[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Set MANPATH so it includes users' private man if it exists
if [ -d "${HOME}/man" ]; then
    export MANPATH=${HOME}/man:${MANPATH}
fi
# private bin
if [ -d "${HOME}/bin" ]; then
    export PATH=${HOME}/bin:${PATH}
fi

# FreeBSD bash-completion
[[ -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
    source /usr/local/share/bash-completion/bash_completion.sh
# Linux bash-completion
[[ -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion

for sh_file in ~/.sh/*.sh; do
    source $sh_file
done

for bash_file in ~/.bash/*.bash; do
  source $bash_file
done
