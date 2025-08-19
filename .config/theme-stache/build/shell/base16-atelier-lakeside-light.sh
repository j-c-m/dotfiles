#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Lakeside Light
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
    print_osc4 0 "eb/f8/ff"
    print_osc4 1 "d2/2d/72"
    print_osc4 2 "56/8c/3b"
    print_osc4 3 "8a/8a/0f"
    print_osc4 4 "25/7f/ad"
    print_osc4 5 "6b/6b/b8"
    print_osc4 6 "2d/8f/6f"
    print_osc4 7 "51/6d/7b"
    print_osc4 8 "71/95/a8"
    print_osc4 9 "d2/2d/72"
    print_osc4 10 "56/8c/3b"
    print_osc4 11 "8a/8a/0f"
    print_osc4 12 "25/7f/ad"
    print_osc4 13 "6b/6b/b8"
    print_osc4 14 "2d/8f/6f"
    print_osc4 15 "16/1b/1d"

    print_osc_rgb 10 "51/6d/7b"
    print_osc_rgb 11 "eb/f8/ff"
    print_osc_rgb 12 "51/6d/7b"
    print_osc_rgb 17 "1f/29/2e"
    print_osc_rgb 19 "c1/e4/f6"
}

do_linux() {
    print_linux 0 "#ebf8ff"
    print_linux 1 "#d22d72"
    print_linux 2 "#568c3b"
    print_linux 3 "#8a8a0f"
    print_linux 4 "#257fad"
    print_linux 5 "#6b6bb8"
    print_linux 6 "#2d8f6f"
    print_linux 7 "#516d7b"
    print_linux 8 "#7195a8"
    print_linux 9 "#d22d72"
    print_linux 10 "#568c3b"
    print_linux 11 "#8a8a0f"
    print_linux 12 "#257fad"
    print_linux 13 "#6b6bb8"
    print_linux 14 "#2d8f6f"
    print_linux 15 "#161b1d"
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
