if [[ -n $ZSH_VERSION && $TERM == "alacritty" ]]; then
    echotc Co &> /dev/null || export TERM=xterm-256color
    return 0
fi

if [[ $TERM == "alacritty" ]]; then
    infocmp &> /dev/null || export TERM=xterm-256color
fi
