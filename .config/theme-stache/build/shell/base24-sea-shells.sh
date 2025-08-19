#!/usr/bin/env bash

# Source:   base24
# Theme:    Sea Shells
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "08/13/1a"
    print_osc4 1 "d1/50/23"
    print_osc4 2 "02/7c/9b"
    print_osc4 3 "1b/bc/dd"
    print_osc4 4 "1e/49/50"
    print_osc4 5 "68/d3/f1"
    print_osc4 6 "50/a3/b5"
    print_osc4 7 "b7/9c/7e"
    print_osc4 8 "69/66/60"
    print_osc4 9 "d3/86/77"
    print_osc4 10 "61/8c/98"
    print_osc4 11 "fd/d2/9e"
    print_osc4 12 "1b/bc/dd"
    print_osc4 13 "bb/e3/ee"
    print_osc4 14 "86/ab/b3"
    print_osc4 15 "fe/e3/cd"

    print_osc_rgb 10 "b7/9c/7e"
    print_osc_rgb 11 "08/13/1a"
    print_osc_rgb 12 "b7/9c/7e"
    print_osc_rgb 17 "de/b8/8d"
    print_osc_rgb 19 "17/38/4c"
}

do_linux() {
    print_linux 0 "#08131a"
    print_linux 1 "#d15023"
    print_linux 2 "#027c9b"
    print_linux 3 "#1bbcdd"
    print_linux 4 "#1e4950"
    print_linux 5 "#68d3f1"
    print_linux 6 "#50a3b5"
    print_linux 7 "#b79c7e"
    print_linux 8 "#696660"
    print_linux 9 "#d38677"
    print_linux 10 "#618c98"
    print_linux 11 "#fdd29e"
    print_linux 12 "#1bbcdd"
    print_linux 13 "#bbe3ee"
    print_linux 14 "#86abb3"
    print_linux 15 "#fee3cd"
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
