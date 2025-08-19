#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Dune Light
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
    print_osc4 0 "fe/fb/ec"
    print_osc4 1 "d7/37/37"
    print_osc4 2 "60/ac/39"
    print_osc4 3 "ae/95/13"
    print_osc4 4 "66/84/e1"
    print_osc4 5 "b8/54/d4"
    print_osc4 6 "1f/ad/83"
    print_osc4 7 "6e/6b/5e"
    print_osc4 8 "99/95/80"
    print_osc4 9 "d7/37/37"
    print_osc4 10 "60/ac/39"
    print_osc4 11 "ae/95/13"
    print_osc4 12 "66/84/e1"
    print_osc4 13 "b8/54/d4"
    print_osc4 14 "1f/ad/83"
    print_osc4 15 "20/20/1d"

    print_osc_rgb 10 "6e/6b/5e"
    print_osc_rgb 11 "fe/fb/ec"
    print_osc_rgb 12 "6e/6b/5e"
    print_osc_rgb 17 "29/28/24"
    print_osc_rgb 19 "e8/e4/cf"
}

do_linux() {
    print_linux 0 "#fefbec"
    print_linux 1 "#d73737"
    print_linux 2 "#60ac39"
    print_linux 3 "#ae9513"
    print_linux 4 "#6684e1"
    print_linux 5 "#b854d4"
    print_linux 6 "#1fad83"
    print_linux 7 "#6e6b5e"
    print_linux 8 "#999580"
    print_linux 9 "#d73737"
    print_linux 10 "#60ac39"
    print_linux 11 "#ae9513"
    print_linux 12 "#6684e1"
    print_linux 13 "#b854d4"
    print_linux 14 "#1fad83"
    print_linux 15 "#20201d"
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
