#export PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Set MANPATH so it includes users' private man if it exists
if [[ -d "${HOME}/man" ]]; then
    export MANPATH=${HOME}/man:${MANPATH}
fi
# private bin
if [[ -d "${HOME}/bin" ]]; then
    export PATH=${HOME}/bin:${PATH}
fi

autoload -U colors && colors
autoload -U compinit && compinit

for zsh_file (~/.zsh/*.zsh); do
  source $zsh_file
done