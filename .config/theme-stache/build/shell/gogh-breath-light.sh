#!/usr/bin/env bash

# Source:   gogh
# Theme:    Breath Light
# Author:   
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
    print_osc4 0 "e8/e8/e8"
    print_osc4 1 "ed/15/15"
    print_osc4 2 "c0/39/2b"
    print_osc4 3 "f6/74/00"
    print_osc4 4 "1d/99/f3"
    print_osc4 5 "9b/59/b6"
    print_osc4 6 "1a/bc/9c"
    print_osc4 7 "fc/fc/fc"
    print_osc4 8 "7f/8c/8d"
    print_osc4 9 "c0/39/2b"
    print_osc4 10 "55/a6/49"
    print_osc4 11 "fd/bc/4b"
    print_osc4 12 "3d/ae/e9"
    print_osc4 13 "8e/44/ad"
    print_osc4 14 "16/a0/85"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "29/2f/34"
    print_osc_rgb 11 "e8/e8/e8"
    print_osc_rgb 12 "29/2f/34"
    print_osc_rgb 17 "29/2f/34"
    print_osc_rgb 19 "e8/e8/e8"
}

do_linux() {
    print_linux 0 "#e8e8e8"
    print_linux 1 "#ed1515"
    print_linux 2 "#c0392b"
    print_linux 3 "#f67400"
    print_linux 4 "#1d99f3"
    print_linux 5 "#9b59b6"
    print_linux 6 "#1abc9c"
    print_linux 7 "#292f34"
    print_linux 8 "#7f8c8d"
    print_linux 9 "#c0392b"
    print_linux 10 "#55a649"
    print_linux 11 "#fdbc4b"
    print_linux 12 "#3daee9"
    print_linux 13 "#8e44ad"
    print_linux 14 "#16a085"
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
