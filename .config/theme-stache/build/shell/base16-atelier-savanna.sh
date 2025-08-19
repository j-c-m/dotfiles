#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Savanna
# Author:   Bram de Haan (http://atelierbramdehaan.nl)
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
    print_osc4 0 "17/1c/19"
    print_osc4 1 "b1/61/39"
    print_osc4 2 "48/99/63"
    print_osc4 3 "a0/7e/3b"
    print_osc4 4 "47/8c/90"
    print_osc4 5 "55/85/9b"
    print_osc4 6 "1c/9a/a0"
    print_osc4 7 "87/92/8a"
    print_osc4 8 "5f/6d/64"
    print_osc4 9 "b1/61/39"
    print_osc4 10 "48/99/63"
    print_osc4 11 "a0/7e/3b"
    print_osc4 12 "47/8c/90"
    print_osc4 13 "55/85/9b"
    print_osc4 14 "1c/9a/a0"
    print_osc4 15 "ec/f4/ee"

    print_osc_rgb 10 "87/92/8a"
    print_osc_rgb 11 "17/1c/19"
    print_osc_rgb 12 "87/92/8a"
    print_osc_rgb 17 "df/e7/e2"
    print_osc_rgb 19 "23/2a/25"
}

do_linux() {
    print_linux 0 "#171c19"
    print_linux 1 "#b16139"
    print_linux 2 "#489963"
    print_linux 3 "#a07e3b"
    print_linux 4 "#478c90"
    print_linux 5 "#55859b"
    print_linux 6 "#1c9aa0"
    print_linux 7 "#87928a"
    print_linux 8 "#5f6d64"
    print_linux 9 "#b16139"
    print_linux 10 "#489963"
    print_linux 11 "#a07e3b"
    print_linux 12 "#478c90"
    print_linux 13 "#55859b"
    print_linux 14 "#1c9aa0"
    print_linux 15 "#ecf4ee"
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
