#!/usr/bin/env bash

# Source:   iterm
# Theme:    Phala Green Dark
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ab/15/00"
    print_osc4 2 "00/b0/00"
    print_osc4 3 "a9/a6/00"
    print_osc4 4 "02/23/bf"
    print_osc4 5 "c1/2d/bf"
    print_osc4 6 "00/b3/bf"
    print_osc4 7 "ca/ca/ca"
    print_osc4 8 "79/79/79"
    print_osc4 9 "ec/22/00"
    print_osc4 10 "00/db/00"
    print_osc4 11 "ea/e6/00"
    print_osc4 12 "04/32/fe"
    print_osc4 13 "ec/3a/ea"
    print_osc4 14 "00/e8/ea"
    print_osc4 15 "ea/ea/ea"

    print_osc_rgb 10 "c0/fb/03"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "c0/fb/03"
    print_osc_rgb 17 "00/47/03"
    print_osc_rgb 19 "fe/fe/fe"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ab1500"
    print_linux 2 "#00b000"
    print_linux 3 "#a9a600"
    print_linux 4 "#0223bf"
    print_linux 5 "#c12dbf"
    print_linux 6 "#00b3bf"
    print_linux 7 "#c0fb03"
    print_linux 8 "#797979"
    print_linux 9 "#ec2200"
    print_linux 10 "#00db00"
    print_linux 11 "#eae600"
    print_linux 12 "#0432fe"
    print_linux 13 "#ec3aea"
    print_linux 14 "#00e8ea"
    print_linux 15 "#eaeaea"
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
