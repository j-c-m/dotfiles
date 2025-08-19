#!/usr/bin/env bash

# Source:   gogh
# Theme:    Chalk
# Author:   
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
    print_osc4 0 "64/64/64"
    print_osc4 1 "f5/8e/8e"
    print_osc4 2 "a9/d3/ab"
    print_osc4 3 "fe/d3/7e"
    print_osc4 4 "7a/ab/d4"
    print_osc4 5 "d6/ad/d5"
    print_osc4 6 "79/d4/d5"
    print_osc4 7 "d4/d4/d4"
    print_osc4 8 "64/64/64"
    print_osc4 9 "f5/8e/8e"
    print_osc4 10 "a9/d3/ab"
    print_osc4 11 "fe/d3/7e"
    print_osc4 12 "7a/ab/d4"
    print_osc4 13 "d6/ad/d5"
    print_osc4 14 "79/d4/d5"
    print_osc4 15 "d4/d4/d4"

    print_osc_rgb 10 "d4/d4/d4"
    print_osc_rgb 11 "2d/2d/2d"
    print_osc_rgb 12 "d4/d4/d4"
    print_osc_rgb 17 "d4/d4/d4"
    print_osc_rgb 19 "2d/2d/2d"
}

do_linux() {
    print_linux 0 "#646464"
    print_linux 1 "#f58e8e"
    print_linux 2 "#a9d3ab"
    print_linux 3 "#fed37e"
    print_linux 4 "#7aabd4"
    print_linux 5 "#d6add5"
    print_linux 6 "#79d4d5"
    print_linux 7 "#d4d4d4"
    print_linux 8 "#646464"
    print_linux 9 "#f58e8e"
    print_linux 10 "#a9d3ab"
    print_linux 11 "#fed37e"
    print_linux 12 "#7aabd4"
    print_linux 13 "#d6add5"
    print_linux 14 "#79d4d5"
    print_linux 15 "#d4d4d4"
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
