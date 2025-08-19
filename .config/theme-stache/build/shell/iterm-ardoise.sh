#!/usr/bin/env bash

# Source:   iterm
# Theme:    Ardoise
# Author:   unknown
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
    print_osc4 0 "2c/2b/2b"
    print_osc4 1 "d2/31/2c"
    print_osc4 2 "58/8b/35"
    print_osc4 3 "fc/a8/3a"
    print_osc4 4 "23/64/c2"
    print_osc4 5 "72/32/b4"
    print_osc4 6 "63/e0/b7"
    print_osc4 7 "f7/f6/f6"
    print_osc4 8 "53/52/52"
    print_osc4 9 "fa/57/52"
    print_osc4 10 "8d/c2/51"
    print_osc4 11 "ff/e9/51"
    print_osc4 12 "6a/b5/f7"
    print_osc4 13 "be/68/c9"
    print_osc4 14 "88/ff/da"
    print_osc4 15 "fe/fd/fd"

    print_osc_rgb 10 "ea/e9/e9"
    print_osc_rgb 11 "1e/1d/1d"
    print_osc_rgb 12 "f7/f6/f6"
    print_osc_rgb 17 "45/50/5d"
    print_osc_rgb 19 "f0/f2/f4"
}

do_linux() {
    print_linux 0 "#2c2b2b"
    print_linux 1 "#d2312c"
    print_linux 2 "#588b35"
    print_linux 3 "#fca83a"
    print_linux 4 "#2364c2"
    print_linux 5 "#7232b4"
    print_linux 6 "#63e0b7"
    print_linux 7 "#eae9e9"
    print_linux 8 "#535252"
    print_linux 9 "#fa5752"
    print_linux 10 "#8dc251"
    print_linux 11 "#ffe951"
    print_linux 12 "#6ab5f7"
    print_linux 13 "#be68c9"
    print_linux 14 "#88ffda"
    print_linux 15 "#fefdfd"
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
