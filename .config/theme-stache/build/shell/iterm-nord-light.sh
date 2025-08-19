#!/usr/bin/env bash

# Source:   iterm
# Theme:    nord-light
# Author:   unknown
# Variant:  light

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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "3b/42/51"
    print_osc4 1 "bf/60/69"
    print_osc4 2 "a3/be/8b"
    print_osc4 3 "ea/cb/8a"
    print_osc4 4 "81/a1/c1"
    print_osc4 5 "b4/8d/ac"
    print_osc4 6 "88/c0/d0"
    print_osc4 7 "d8/de/e9"
    print_osc4 8 "4c/55/6a"
    print_osc4 9 "bf/60/69"
    print_osc4 10 "a3/be/8b"
    print_osc4 11 "ea/cb/8a"
    print_osc4 12 "81/a1/c1"
    print_osc4 13 "b4/8d/ac"
    print_osc4 14 "8f/bc/bb"
    print_osc4 15 "ec/ef/f4"

    print_osc_rgb 10 "41/48/58"
    print_osc_rgb 11 "e5/e9/f0"
    print_osc_rgb 12 "88/c0/d0"
    print_osc_rgb 17 "d8/de/e9"
    print_osc_rgb 19 "4c/55/6a"
}

do_linux() {
    print_linux 0 "#3b4251"
    print_linux 1 "#bf6069"
    print_linux 2 "#a3be8b"
    print_linux 3 "#eacb8a"
    print_linux 4 "#81a1c1"
    print_linux 5 "#b48dac"
    print_linux 6 "#88c0d0"
    print_linux 7 "#414858"
    print_linux 8 "#4c556a"
    print_linux 9 "#bf6069"
    print_linux 10 "#a3be8b"
    print_linux 11 "#eacb8a"
    print_linux 12 "#81a1c1"
    print_linux 13 "#b48dac"
    print_linux 14 "#8fbcbb"
    print_linux 15 "#eceff4"
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
