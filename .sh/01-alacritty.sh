if [ "$TERM" = "alacritty" ]; then
    if ! tset - &> /dev/null; then
        export TERM=xterm-256color
    fi
fi
