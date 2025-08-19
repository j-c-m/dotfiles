#!/usr/bin/env bash

# Source:   base24
# Theme:    Flat
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "08/28/45"
    print_osc4 1 "a8/23/20"
    print_osc4 2 "2d/94/40"
    print_osc4 3 "3c/7d/d2"
    print_osc4 4 "31/67/ac"
    print_osc4 5 "78/1a/a0"
    print_osc4 6 "2c/93/70"
    print_osc4 7 "8c/93/9a"
    print_osc4 8 "44/4e/5b"
    print_osc4 9 "d4/31/2e"
    print_osc4 10 "32/a5/48"
    print_osc4 11 "e5/be/0c"
    print_osc4 12 "3c/7d/d2"
    print_osc4 13 "82/30/a7"
    print_osc4 14 "35/b3/87"
    print_osc4 15 "e7/ec/ed"

    print_osc_rgb 10 "8c/93/9a"
    print_osc_rgb 11 "08/28/45"
    print_osc_rgb 12 "8c/93/9a"
    print_osc_rgb 17 "b0/b6/ba"
    print_osc_rgb 19 "1d/28/45"
}

do_linux() {
    print_linux 0 "#082845"
    print_linux 1 "#a82320"
    print_linux 2 "#2d9440"
    print_linux 3 "#3c7dd2"
    print_linux 4 "#3167ac"
    print_linux 5 "#781aa0"
    print_linux 6 "#2c9370"
    print_linux 7 "#8c939a"
    print_linux 8 "#444e5b"
    print_linux 9 "#d4312e"
    print_linux 10 "#32a548"
    print_linux 11 "#e5be0c"
    print_linux 12 "#3c7dd2"
    print_linux 13 "#8230a7"
    print_linux 14 "#35b387"
    print_linux 15 "#e7eced"
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
