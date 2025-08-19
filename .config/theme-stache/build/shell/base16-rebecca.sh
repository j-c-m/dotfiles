#!/usr/bin/env bash

# Source:   base16
# Theme:    Rebecca
# Author:   Victor Borja (http://github.com/vic) based on Rebecca Theme (http://github.com/vic/rebecca-theme)
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
    print_osc4 0 "29/2a/44"
    print_osc4 1 "a0/a0/c5"
    print_osc4 2 "6d/fe/df"
    print_osc4 3 "ae/81/ff"
    print_osc4 4 "2d/e0/a7"
    print_osc4 5 "7a/a5/ff"
    print_osc4 6 "8e/ae/e0"
    print_osc4 7 "f1/ef/f8"
    print_osc4 8 "66/66/99"
    print_osc4 9 "a0/a0/c5"
    print_osc4 10 "6d/fe/df"
    print_osc4 11 "ae/81/ff"
    print_osc4 12 "2d/e0/a7"
    print_osc4 13 "7a/a5/ff"
    print_osc4 14 "8e/ae/e0"
    print_osc4 15 "53/49/5d"

    print_osc_rgb 10 "f1/ef/f8"
    print_osc_rgb 11 "29/2a/44"
    print_osc_rgb 12 "f1/ef/f8"
    print_osc_rgb 17 "cc/cc/ff"
    print_osc_rgb 19 "66/33/99"
}

do_linux() {
    print_linux 0 "#292a44"
    print_linux 1 "#a0a0c5"
    print_linux 2 "#6dfedf"
    print_linux 3 "#ae81ff"
    print_linux 4 "#2de0a7"
    print_linux 5 "#7aa5ff"
    print_linux 6 "#8eaee0"
    print_linux 7 "#f1eff8"
    print_linux 8 "#666699"
    print_linux 9 "#a0a0c5"
    print_linux 10 "#6dfedf"
    print_linux 11 "#ae81ff"
    print_linux 12 "#2de0a7"
    print_linux 13 "#7aa5ff"
    print_linux 14 "#8eaee0"
    print_linux 15 "#53495d"
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
