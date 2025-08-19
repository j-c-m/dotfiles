#!/usr/bin/env bash

# Source:   base16
# Theme:    Rosé Pine Dawn
# Author:   Emilia Dunfelt &lt;edun@dunfelt.se&gt;
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
    print_osc4 0 "fa/f4/ed"
    print_osc4 1 "b4/63/7a"
    print_osc4 2 "28/69/83"
    print_osc4 3 "d7/82/7e"
    print_osc4 4 "90/7a/a9"
    print_osc4 5 "ea/9d/34"
    print_osc4 6 "56/94/9f"
    print_osc4 7 "57/52/79"
    print_osc4 8 "98/93/a5"
    print_osc4 9 "b4/63/7a"
    print_osc4 10 "28/69/83"
    print_osc4 11 "d7/82/7e"
    print_osc4 12 "90/7a/a9"
    print_osc4 13 "ea/9d/34"
    print_osc4 14 "56/94/9f"
    print_osc4 15 "ce/ca/cd"

    print_osc_rgb 10 "57/52/79"
    print_osc_rgb 11 "fa/f4/ed"
    print_osc_rgb 12 "57/52/79"
    print_osc_rgb 17 "57/52/79"
    print_osc_rgb 19 "ff/fa/f3"
}

do_linux() {
    print_linux 0 "#faf4ed"
    print_linux 1 "#b4637a"
    print_linux 2 "#286983"
    print_linux 3 "#d7827e"
    print_linux 4 "#907aa9"
    print_linux 5 "#ea9d34"
    print_linux 6 "#56949f"
    print_linux 7 "#575279"
    print_linux 8 "#9893a5"
    print_linux 9 "#b4637a"
    print_linux 10 "#286983"
    print_linux 11 "#d7827e"
    print_linux 12 "#907aa9"
    print_linux 13 "#ea9d34"
    print_linux 14 "#56949f"
    print_linux 15 "#cecacd"
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
