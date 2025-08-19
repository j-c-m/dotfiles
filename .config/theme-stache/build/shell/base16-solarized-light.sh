#!/usr/bin/env bash

# Source:   base16
# Theme:    Solarized Light
# Author:   Ethan Schoonover (modified by aramisgithub)
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
    print_osc4 0 "fd/f6/e3"
    print_osc4 1 "dc/32/2f"
    print_osc4 2 "85/99/00"
    print_osc4 3 "b5/89/00"
    print_osc4 4 "26/8b/d2"
    print_osc4 5 "6c/71/c4"
    print_osc4 6 "2a/a1/98"
    print_osc4 7 "58/6e/75"
    print_osc4 8 "83/94/96"
    print_osc4 9 "dc/32/2f"
    print_osc4 10 "85/99/00"
    print_osc4 11 "b5/89/00"
    print_osc4 12 "26/8b/d2"
    print_osc4 13 "6c/71/c4"
    print_osc4 14 "2a/a1/98"
    print_osc4 15 "00/2b/36"

    print_osc_rgb 10 "58/6e/75"
    print_osc_rgb 11 "fd/f6/e3"
    print_osc_rgb 12 "58/6e/75"
    print_osc_rgb 17 "07/36/42"
    print_osc_rgb 19 "ee/e8/d5"
}

do_linux() {
    print_linux 0 "#fdf6e3"
    print_linux 1 "#dc322f"
    print_linux 2 "#859900"
    print_linux 3 "#b58900"
    print_linux 4 "#268bd2"
    print_linux 5 "#6c71c4"
    print_linux 6 "#2aa198"
    print_linux 7 "#586e75"
    print_linux 8 "#839496"
    print_linux 9 "#dc322f"
    print_linux 10 "#859900"
    print_linux 11 "#b58900"
    print_linux 12 "#268bd2"
    print_linux 13 "#6c71c4"
    print_linux 14 "#2aa198"
    print_linux 15 "#002b36"
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
