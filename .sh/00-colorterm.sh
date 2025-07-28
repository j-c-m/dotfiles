[ -n "$COLORTERM" ] && return

case $TERM in
    xterm-256color|vte-256color|konsole*|iterm2*|alacritty*|xterm-kitty|\
    wezterm|xterm-direct|rxvt-unicode*|st-256color|foot*|contour|tmux*|\
    screen-256color)
        export COLORTERM=truecolor
        ;;
esac

