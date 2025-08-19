#!/usr/bin/env bash

# Source:   base24
# Theme:    Fideloper
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
    print_osc4 0 "28/2f/32"
    print_osc4 1 "ca/1d/2c"
    print_osc4 2 "ed/b7/ab"
    print_osc4 3 "7c/84/c4"
    print_osc4 4 "2e/78/c1"
    print_osc4 5 "c0/22/6e"
    print_osc4 6 "30/91/85"
    print_osc4 7 "b1/b1/a3"
    print_osc4 8 "41/50/50"
    print_osc4 9 "d3/5f/5a"
    print_osc4 10 "d3/5f/5a"
    print_osc4 11 "a8/65/71"
    print_osc4 12 "7c/84/c4"
    print_osc4 13 "5b/5d/b2"
    print_osc4 14 "81/90/8f"
    print_osc4 15 "fc/f4/de"

    print_osc_rgb 10 "b1/b1/a3"
    print_osc_rgb 11 "28/2f/32"
    print_osc_rgb 12 "b1/b1/a3"
    print_osc_rgb 17 "e9/e2/cd"
    print_osc_rgb 19 "28/2f/32"
}

do_linux() {
    print_linux 0 "#282f32"
    print_linux 1 "#ca1d2c"
    print_linux 2 "#edb7ab"
    print_linux 3 "#7c84c4"
    print_linux 4 "#2e78c1"
    print_linux 5 "#c0226e"
    print_linux 6 "#309185"
    print_linux 7 "#b1b1a3"
    print_linux 8 "#415050"
    print_linux 9 "#d35f5a"
    print_linux 10 "#d35f5a"
    print_linux 11 "#a86571"
    print_linux 12 "#7c84c4"
    print_linux 13 "#5b5db2"
    print_linux 14 "#81908f"
    print_linux 15 "#fcf4de"
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
