#!/usr/bin/env bash

# Source:   base16
# Theme:    Silk Light
# Author:   Gabriel Fontes (https://github.com/Misterio77)
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
    print_osc4 0 "e9/f1/ef"
    print_osc4 1 "cf/43/2e"
    print_osc4 2 "6c/a3/8c"
    print_osc4 3 "cf/ad/25"
    print_osc4 4 "39/aa/c9"
    print_osc4 5 "6e/65/82"
    print_osc4 6 "32/9c/a2"
    print_osc4 7 "38/51/56"
    print_osc4 8 "5c/78/7b"
    print_osc4 9 "cf/43/2e"
    print_osc4 10 "6c/a3/8c"
    print_osc4 11 "cf/ad/25"
    print_osc4 12 "39/aa/c9"
    print_osc4 13 "6e/65/82"
    print_osc4 14 "32/9c/a2"
    print_osc4 15 "d2/fa/ff"

    print_osc_rgb 10 "38/51/56"
    print_osc_rgb 11 "e9/f1/ef"
    print_osc_rgb 12 "38/51/56"
    print_osc_rgb 17 "0e/3c/46"
    print_osc_rgb 19 "cc/d4/d3"
}

do_linux() {
    print_linux 0 "#e9f1ef"
    print_linux 1 "#cf432e"
    print_linux 2 "#6ca38c"
    print_linux 3 "#cfad25"
    print_linux 4 "#39aac9"
    print_linux 5 "#6e6582"
    print_linux 6 "#329ca2"
    print_linux 7 "#385156"
    print_linux 8 "#5c787b"
    print_linux 9 "#cf432e"
    print_linux 10 "#6ca38c"
    print_linux 11 "#cfad25"
    print_linux 12 "#39aac9"
    print_linux 13 "#6e6582"
    print_linux 14 "#329ca2"
    print_linux 15 "#d2faff"
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
