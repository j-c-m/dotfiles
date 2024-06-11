if [ "$TERM" = "alacritty" ]; then
    infocmp &> /dev/null || export TERM=xterm-256color
fi
