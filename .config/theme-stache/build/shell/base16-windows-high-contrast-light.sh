#!/usr/bin/env bash

# Source:   base16
# Theme:    Windows High Contrast Light
# Author:   Fergus Collins (https://github.com/ferguscollins)
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
    print_osc4 0 "fc/fc/fc"
    print_osc4 1 "80/00/00"
    print_osc4 2 "00/80/00"
    print_osc4 3 "80/80/00"
    print_osc4 4 "00/00/80"
    print_osc4 5 "80/00/80"
    print_osc4 6 "00/80/80"
    print_osc4 7 "54/54/54"
    print_osc4 8 "c0/c0/c0"
    print_osc4 9 "80/00/00"
    print_osc4 10 "00/80/00"
    print_osc4 11 "80/80/00"
    print_osc4 12 "00/00/80"
    print_osc4 13 "80/00/80"
    print_osc4 14 "00/80/80"
    print_osc4 15 "00/00/00"

    print_osc_rgb 10 "54/54/54"
    print_osc_rgb 11 "fc/fc/fc"
    print_osc_rgb 12 "54/54/54"
    print_osc_rgb 17 "2a/2a/2a"
    print_osc_rgb 19 "e8/e8/e8"
}

do_linux() {
    print_linux 0 "#fcfcfc"
    print_linux 1 "#800000"
    print_linux 2 "#008000"
    print_linux 3 "#808000"
    print_linux 4 "#000080"
    print_linux 5 "#800080"
    print_linux 6 "#008080"
    print_linux 7 "#545454"
    print_linux 8 "#c0c0c0"
    print_linux 9 "#800000"
    print_linux 10 "#008000"
    print_linux 11 "#808000"
    print_linux 12 "#000080"
    print_linux 13 "#800080"
    print_linux 14 "#008080"
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
