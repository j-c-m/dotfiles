#!/usr/bin/env bash

# Source:   gogh
# Theme:    Astrodark
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "11/13/17"
    print_osc4 1 "f8/74/7e"
    print_osc4 2 "75/ad/47"
    print_osc4 3 "d0/92/14"
    print_osc4 4 "50/a4/e9"
    print_osc4 5 "cc/83/e3"
    print_osc4 6 "00/b2/98"
    print_osc4 7 "ad/b0/bb"
    print_osc4 8 "57/61/76"
    print_osc4 9 "fa/a5/ab"
    print_osc4 10 "a5/cd/84"
    print_osc4 11 "ef/bd/58"
    print_osc4 12 "8d/c3/f1"
    print_osc4 13 "de/ae/ed"
    print_osc4 14 "27/ff/df"
    print_osc4 15 "ca/cc/d3"

    print_osc_rgb 10 "9b/9f/a9"
    print_osc_rgb 11 "1a/1d/23"
    print_osc_rgb 12 "ca/cc/d3"
    print_osc_rgb 17 "9b/9f/a9"
    print_osc_rgb 19 "1a/1d/23"
}

do_linux() {
    print_linux 0 "#111317"
    print_linux 1 "#f8747e"
    print_linux 2 "#75ad47"
    print_linux 3 "#d09214"
    print_linux 4 "#50a4e9"
    print_linux 5 "#cc83e3"
    print_linux 6 "#00b298"
    print_linux 7 "#9b9fa9"
    print_linux 8 "#576176"
    print_linux 9 "#faa5ab"
    print_linux 10 "#a5cd84"
    print_linux 11 "#efbd58"
    print_linux 12 "#8dc3f1"
    print_linux 13 "#deaeed"
    print_linux 14 "#27ffdf"
    print_linux 15 "#caccd3"
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
