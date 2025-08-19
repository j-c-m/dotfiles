#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Estuary Light
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
    print_osc4 0 "f4/f3/ec"
    print_osc4 1 "ba/62/36"
    print_osc4 2 "7d/97/26"
    print_osc4 3 "a5/98/0d"
    print_osc4 4 "36/a1/66"
    print_osc4 5 "5f/91/82"
    print_osc4 6 "5b/9d/48"
    print_osc4 7 "5f/5e/4e"
    print_osc4 8 "87/85/73"
    print_osc4 9 "ba/62/36"
    print_osc4 10 "7d/97/26"
    print_osc4 11 "a5/98/0d"
    print_osc4 12 "36/a1/66"
    print_osc4 13 "5f/91/82"
    print_osc4 14 "5b/9d/48"
    print_osc4 15 "22/22/1b"

    print_osc_rgb 10 "5f/5e/4e"
    print_osc_rgb 11 "f4/f3/ec"
    print_osc_rgb 12 "5f/5e/4e"
    print_osc_rgb 17 "30/2f/27"
    print_osc_rgb 19 "e7/e6/df"
}

do_linux() {
    print_linux 0 "#f4f3ec"
    print_linux 1 "#ba6236"
    print_linux 2 "#7d9726"
    print_linux 3 "#a5980d"
    print_linux 4 "#36a166"
    print_linux 5 "#5f9182"
    print_linux 6 "#5b9d48"
    print_linux 7 "#5f5e4e"
    print_linux 8 "#878573"
    print_linux 9 "#ba6236"
    print_linux 10 "#7d9726"
    print_linux 11 "#a5980d"
    print_linux 12 "#36a166"
    print_linux 13 "#5f9182"
    print_linux 14 "#5b9d48"
    print_linux 15 "#22221b"
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
