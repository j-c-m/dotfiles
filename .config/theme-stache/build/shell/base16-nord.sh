#!/usr/bin/env bash

# Source:   base16
# Theme:    Nord
# Author:   arcticicestudio
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "2e/34/40"
    print_osc4 1 "bf/61/6a"
    print_osc4 2 "a3/be/8c"
    print_osc4 3 "eb/cb/8b"
    print_osc4 4 "81/a1/c1"
    print_osc4 5 "b4/8e/ad"
    print_osc4 6 "88/c0/d0"
    print_osc4 7 "e5/e9/f0"
    print_osc4 8 "4c/56/6a"
    print_osc4 9 "bf/61/6a"
    print_osc4 10 "a3/be/8c"
    print_osc4 11 "eb/cb/8b"
    print_osc4 12 "81/a1/c1"
    print_osc4 13 "b4/8e/ad"
    print_osc4 14 "88/c0/d0"
    print_osc4 15 "8f/bc/bb"

    print_osc_rgb 10 "e5/e9/f0"
    print_osc_rgb 11 "2e/34/40"
    print_osc_rgb 12 "e5/e9/f0"
    print_osc_rgb 17 "ec/ef/f4"
    print_osc_rgb 19 "3b/42/52"
}

do_linux() {
    print_linux 0 "#2e3440"
    print_linux 1 "#bf616a"
    print_linux 2 "#a3be8c"
    print_linux 3 "#ebcb8b"
    print_linux 4 "#81a1c1"
    print_linux 5 "#b48ead"
    print_linux 6 "#88c0d0"
    print_linux 7 "#e5e9f0"
    print_linux 8 "#4c566a"
    print_linux 9 "#bf616a"
    print_linux 10 "#a3be8c"
    print_linux 11 "#ebcb8b"
    print_linux 12 "#81a1c1"
    print_linux 13 "#b48ead"
    print_linux 14 "#88c0d0"
    print_linux 15 "#8fbcbb"
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
