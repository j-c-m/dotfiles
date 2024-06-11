if [ "$TERM" = "alacritty" ]; then
    tset - &> /dev/null || export TERM=xterm-256color
fi
