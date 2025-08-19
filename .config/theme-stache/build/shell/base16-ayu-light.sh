#!/usr/bin/env bash

# Source:   base16
# Theme:    Ayu Light
# Author:   Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)
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
    print_osc4 0 "f8/f9/fa"
    print_osc4 1 "f0/71/71"
    print_osc4 2 "6c/bf/49"
    print_osc4 3 "f2/ae/49"
    print_osc4 4 "39/9e/e6"
    print_osc4 5 "a3/7a/cc"
    print_osc4 6 "4c/bf/99"
    print_osc4 7 "5c/61/66"
    print_osc4 8 "a0/a6/ac"
    print_osc4 9 "f0/71/71"
    print_osc4 10 "6c/bf/49"
    print_osc4 11 "f2/ae/49"
    print_osc4 12 "39/9e/e6"
    print_osc4 13 "a3/7a/cc"
    print_osc4 14 "4c/bf/99"
    print_osc4 15 "40/44/47"

    print_osc_rgb 10 "5c/61/66"
    print_osc_rgb 11 "f8/f9/fa"
    print_osc_rgb 12 "5c/61/66"
    print_osc_rgb 17 "4e/52/57"
    print_osc_rgb 19 "ed/ef/f1"
}

do_linux() {
    print_linux 0 "#f8f9fa"
    print_linux 1 "#f07171"
    print_linux 2 "#6cbf49"
    print_linux 3 "#f2ae49"
    print_linux 4 "#399ee6"
    print_linux 5 "#a37acc"
    print_linux 6 "#4cbf99"
    print_linux 7 "#5c6166"
    print_linux 8 "#a0a6ac"
    print_linux 9 "#f07171"
    print_linux 10 "#6cbf49"
    print_linux 11 "#f2ae49"
    print_linux 12 "#399ee6"
    print_linux 13 "#a37acc"
    print_linux 14 "#4cbf99"
    print_linux 15 "#404447"
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
