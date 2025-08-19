#!/usr/bin/env bash

# Source:   base16
# Theme:    Shapeshifter
# Author:   Tyler Benziger (http://tybenz.com)
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "f9/f9/f9"
    print_osc4 1 "e9/2f/2f"
    print_osc4 2 "0e/d8/39"
    print_osc4 3 "dd/dd/13"
    print_osc4 4 "3b/48/e3"
    print_osc4 5 "f9/96/e2"
    print_osc4 6 "23/ed/da"
    print_osc4 7 "10/20/15"
    print_osc4 8 "55/55/55"
    print_osc4 9 "e9/2f/2f"
    print_osc4 10 "0e/d8/39"
    print_osc4 11 "dd/dd/13"
    print_osc4 12 "3b/48/e3"
    print_osc4 13 "f9/96/e2"
    print_osc4 14 "23/ed/da"
    print_osc4 15 "00/00/00"

    print_osc_rgb 10 "10/20/15"
    print_osc_rgb 11 "f9/f9/f9"
    print_osc_rgb 12 "10/20/15"
    print_osc_rgb 17 "04/04/04"
    print_osc_rgb 19 "e0/e0/e0"
}

do_linux() {
    print_linux 0 "#f9f9f9"
    print_linux 1 "#e92f2f"
    print_linux 2 "#0ed839"
    print_linux 3 "#dddd13"
    print_linux 4 "#3b48e3"
    print_linux 5 "#f996e2"
    print_linux 6 "#23edda"
    print_linux 7 "#102015"
    print_linux 8 "#555555"
    print_linux 9 "#e92f2f"
    print_linux 10 "#0ed839"
    print_linux 11 "#dddd13"
    print_linux 12 "#3b48e3"
    print_linux 13 "#f996e2"
    print_linux 14 "#23edda"
    print_linux 15 "#000000"
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
