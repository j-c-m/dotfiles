#!/usr/bin/env bash

# Source:   base16
# Theme:    Bright
# Author:   Chris Kempson (http://chriskempson.com)
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "fb/01/20"
    print_osc4 2 "a1/c6/59"
    print_osc4 3 "fd/a3/31"
    print_osc4 4 "6f/b3/d2"
    print_osc4 5 "d3/81/c3"
    print_osc4 6 "76/c7/b7"
    print_osc4 7 "e0/e0/e0"
    print_osc4 8 "b0/b0/b0"
    print_osc4 9 "fb/01/20"
    print_osc4 10 "a1/c6/59"
    print_osc4 11 "fd/a3/31"
    print_osc4 12 "6f/b3/d2"
    print_osc4 13 "d3/81/c3"
    print_osc4 14 "76/c7/b7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e0/e0/e0"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "e0/e0/e0"
    print_osc_rgb 17 "f5/f5/f5"
    print_osc_rgb 19 "30/30/30"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fb0120"
    print_linux 2 "#a1c659"
    print_linux 3 "#fda331"
    print_linux 4 "#6fb3d2"
    print_linux 5 "#d381c3"
    print_linux 6 "#76c7b7"
    print_linux 7 "#e0e0e0"
    print_linux 8 "#b0b0b0"
    print_linux 9 "#fb0120"
    print_linux 10 "#a1c659"
    print_linux 11 "#fda331"
    print_linux 12 "#6fb3d2"
    print_linux 13 "#d381c3"
    print_linux 14 "#76c7b7"
    print_linux 15 "#ffffff"
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
