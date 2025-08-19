#!/usr/bin/env bash

# Source:   base16
# Theme:    OceanicNext
# Author:   https://github.com/voronianski/oceanic-next-color-scheme
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
    print_osc4 0 "1b/2b/34"
    print_osc4 1 "ec/5f/67"
    print_osc4 2 "99/c7/94"
    print_osc4 3 "fa/c8/63"
    print_osc4 4 "66/99/cc"
    print_osc4 5 "c5/94/c5"
    print_osc4 6 "5f/b3/b3"
    print_osc4 7 "c0/c5/ce"
    print_osc4 8 "65/73/7e"
    print_osc4 9 "ec/5f/67"
    print_osc4 10 "99/c7/94"
    print_osc4 11 "fa/c8/63"
    print_osc4 12 "66/99/cc"
    print_osc4 13 "c5/94/c5"
    print_osc4 14 "5f/b3/b3"
    print_osc4 15 "d8/de/e9"

    print_osc_rgb 10 "c0/c5/ce"
    print_osc_rgb 11 "1b/2b/34"
    print_osc_rgb 12 "c0/c5/ce"
    print_osc_rgb 17 "cd/d3/de"
    print_osc_rgb 19 "34/3d/46"
}

do_linux() {
    print_linux 0 "#1b2b34"
    print_linux 1 "#ec5f67"
    print_linux 2 "#99c794"
    print_linux 3 "#fac863"
    print_linux 4 "#6699cc"
    print_linux 5 "#c594c5"
    print_linux 6 "#5fb3b3"
    print_linux 7 "#c0c5ce"
    print_linux 8 "#65737e"
    print_linux 9 "#ec5f67"
    print_linux 10 "#99c794"
    print_linux 11 "#fac863"
    print_linux 12 "#6699cc"
    print_linux 13 "#c594c5"
    print_linux 14 "#5fb3b3"
    print_linux 15 "#d8dee9"
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
