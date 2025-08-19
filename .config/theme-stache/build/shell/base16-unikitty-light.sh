#!/usr/bin/env bash

# Source:   base16
# Theme:    Unikitty Light
# Author:   Josh W Lewis (@joshwlewis)
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "ff/ff/ff"
    print_osc4 1 "d8/13/7f"
    print_osc4 2 "17/ad/98"
    print_osc4 3 "dc/8a/0e"
    print_osc4 4 "77/5d/ff"
    print_osc4 5 "aa/17/e6"
    print_osc4 6 "14/9b/da"
    print_osc4 7 "6c/69/6e"
    print_osc4 8 "a7/a5/a8"
    print_osc4 9 "d8/13/7f"
    print_osc4 10 "17/ad/98"
    print_osc4 11 "dc/8a/0e"
    print_osc4 12 "77/5d/ff"
    print_osc4 13 "aa/17/e6"
    print_osc4 14 "14/9b/da"
    print_osc4 15 "32/2d/34"

    print_osc_rgb 10 "6c/69/6e"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "6c/69/6e"
    print_osc_rgb 17 "4f/4b/51"
    print_osc_rgb 19 "e1/e1/e2"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#d8137f"
    print_linux 2 "#17ad98"
    print_linux 3 "#dc8a0e"
    print_linux 4 "#775dff"
    print_linux 5 "#aa17e6"
    print_linux 6 "#149bda"
    print_linux 7 "#6c696e"
    print_linux 8 "#a7a5a8"
    print_linux 9 "#d8137f"
    print_linux 10 "#17ad98"
    print_linux 11 "#dc8a0e"
    print_linux 12 "#775dff"
    print_linux 13 "#aa17e6"
    print_linux 14 "#149bda"
    print_linux 15 "#322d34"
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
