#!/usr/bin/env bash

# Source:   iterm
# Theme:    Laser
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
    print_osc4 0 "61/61/61"
    print_osc4 1 "ff/82/72"
    print_osc4 2 "b4/fa/72"
    print_osc4 3 "09/b4/bd"
    print_osc4 4 "fe/d3/00"
    print_osc4 5 "ff/8f/fd"
    print_osc4 6 "d0/d1/fe"
    print_osc4 7 "f1/f1/f1"
    print_osc4 8 "8e/8e/8e"
    print_osc4 9 "ff/c4/bd"
    print_osc4 10 "d6/fc/b9"
    print_osc4 11 "fe/fd/d5"
    print_osc4 12 "f9/28/83"
    print_osc4 13 "ff/b1/fe"
    print_osc4 14 "e5/e6/fe"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "f1/06/e3"
    print_osc_rgb 11 "03/0d/18"
    print_osc_rgb 12 "00/ff/9c"
    print_osc_rgb 17 "2d/1f/69"
    print_osc_rgb 19 "f4/f4/f4"
}

do_linux() {
    print_linux 0 "#616161"
    print_linux 1 "#ff8272"
    print_linux 2 "#b4fa72"
    print_linux 3 "#09b4bd"
    print_linux 4 "#fed300"
    print_linux 5 "#ff8ffd"
    print_linux 6 "#d0d1fe"
    print_linux 7 "#f106e3"
    print_linux 8 "#8e8e8e"
    print_linux 9 "#ffc4bd"
    print_linux 10 "#d6fcb9"
    print_linux 11 "#fefdd5"
    print_linux 12 "#f92883"
    print_linux 13 "#ffb1fe"
    print_linux 14 "#e5e6fe"
    print_linux 15 "#feffff"
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
