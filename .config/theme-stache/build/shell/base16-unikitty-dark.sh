#!/usr/bin/env bash

# Source:   base16
# Theme:    Unikitty Dark
# Author:   Josh W Lewis (@joshwlewis)
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
    print_osc4 0 "2e/2a/31"
    print_osc4 1 "d8/13/7f"
    print_osc4 2 "17/ad/98"
    print_osc4 3 "dc/8a/0e"
    print_osc4 4 "79/6a/f5"
    print_osc4 5 "bb/60/ea"
    print_osc4 6 "14/9b/da"
    print_osc4 7 "bc/ba/be"
    print_osc4 8 "83/80/85"
    print_osc4 9 "d8/13/7f"
    print_osc4 10 "17/ad/98"
    print_osc4 11 "dc/8a/0e"
    print_osc4 12 "79/6a/f5"
    print_osc4 13 "bb/60/ea"
    print_osc4 14 "14/9b/da"
    print_osc4 15 "f5/f4/f7"

    print_osc_rgb 10 "bc/ba/be"
    print_osc_rgb 11 "2e/2a/31"
    print_osc_rgb 12 "bc/ba/be"
    print_osc_rgb 17 "d8/d7/da"
    print_osc_rgb 19 "4a/46/4d"
}

do_linux() {
    print_linux 0 "#2e2a31"
    print_linux 1 "#d8137f"
    print_linux 2 "#17ad98"
    print_linux 3 "#dc8a0e"
    print_linux 4 "#796af5"
    print_linux 5 "#bb60ea"
    print_linux 6 "#149bda"
    print_linux 7 "#bcbabe"
    print_linux 8 "#838085"
    print_linux 9 "#d8137f"
    print_linux 10 "#17ad98"
    print_linux 11 "#dc8a0e"
    print_linux 12 "#796af5"
    print_linux 13 "#bb60ea"
    print_linux 14 "#149bda"
    print_linux 15 "#f5f4f7"
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
