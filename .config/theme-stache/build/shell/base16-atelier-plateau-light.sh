#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Plateau Light
# Author:   Bram de Haan (http://atelierbramdehaan.nl)
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
    print_osc4 0 "f4/ec/ec"
    print_osc4 1 "ca/49/49"
    print_osc4 2 "4b/8b/8b"
    print_osc4 3 "a0/6e/3b"
    print_osc4 4 "72/72/ca"
    print_osc4 5 "84/64/c4"
    print_osc4 6 "54/85/b6"
    print_osc4 7 "58/50/50"
    print_osc4 8 "7e/77/77"
    print_osc4 9 "ca/49/49"
    print_osc4 10 "4b/8b/8b"
    print_osc4 11 "a0/6e/3b"
    print_osc4 12 "72/72/ca"
    print_osc4 13 "84/64/c4"
    print_osc4 14 "54/85/b6"
    print_osc4 15 "1b/18/18"

    print_osc_rgb 10 "58/50/50"
    print_osc_rgb 11 "f4/ec/ec"
    print_osc_rgb 12 "58/50/50"
    print_osc_rgb 17 "29/24/24"
    print_osc_rgb 19 "e7/df/df"
}

do_linux() {
    print_linux 0 "#f4ecec"
    print_linux 1 "#ca4949"
    print_linux 2 "#4b8b8b"
    print_linux 3 "#a06e3b"
    print_linux 4 "#7272ca"
    print_linux 5 "#8464c4"
    print_linux 6 "#5485b6"
    print_linux 7 "#585050"
    print_linux 8 "#7e7777"
    print_linux 9 "#ca4949"
    print_linux 10 "#4b8b8b"
    print_linux 11 "#a06e3b"
    print_linux 12 "#7272ca"
    print_linux 13 "#8464c4"
    print_linux 14 "#5485b6"
    print_linux 15 "#1b1818"
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
