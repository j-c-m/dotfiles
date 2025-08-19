#!/usr/bin/env bash

# Source:   iterm
# Theme:    midnight-in-mojave
# Author:   unknown
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

print_osc4() {
    local color="$1"
    local hexterm="$2"

    printf "\033]4;%d;rgb:%s\033\\" "$color" "$hexterm"
}

print_osc_rgb() {
    local osc="$1"
    local hexterm="$2"

    printf "\033]%d;rgb:%s\033\\" "$osc" "$hexterm"
}

print_linux() {
    local color="$1"
    local hex="$2"

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "1e/1e/1e"
    print_osc4 1 "ff/45/3a"
    print_osc4 2 "32/d7/4b"
    print_osc4 3 "ff/d6/0a"
    print_osc4 4 "0a/84/ff"
    print_osc4 5 "bf/5a/f2"
    print_osc4 6 "5a/c8/fa"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "1e/1e/1e"
    print_osc4 9 "ff/45/3a"
    print_osc4 10 "32/d7/4b"
    print_osc4 11 "ff/d6/0a"
    print_osc4 12 "0a/84/ff"
    print_osc4 13 "bf/5a/f2"
    print_osc4 14 "5a/c8/fa"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "1e/1e/1e"
    print_osc_rgb 12 "32/d7/4b"
    print_osc_rgb 17 "4a/50/4d"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#1e1e1e"
    print_linux 1 "#ff453a"
    print_linux 2 "#32d74b"
    print_linux 3 "#ffd60a"
    print_linux 4 "#0a84ff"
    print_linux 5 "#bf5af2"
    print_linux 6 "#5ac8fa"
    print_linux 7 "#ffffff"
    print_linux 8 "#1e1e1e"
    print_linux 9 "#ff453a"
    print_linux 10 "#32d74b"
    print_linux 11 "#ffd60a"
    print_linux 12 "#0a84ff"
    print_linux 13 "#bf5af2"
    print_linux 14 "#5ac8fa"
    print_linux 15 "#ffffff"
}

case "$TERM" in
    linux*)
        do_linux
        ;;
    *)
        do_osc
        ;;
esac

unset -f print_osc4
unset -f print_osc_rgb
unset -f print_linux
unset -f do_osc
unset -f do_linux
