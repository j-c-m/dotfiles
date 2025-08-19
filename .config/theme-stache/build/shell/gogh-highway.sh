#!/usr/bin/env bash

# Source:   gogh
# Theme:    Highway
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "d0/0e/18"
    print_osc4 2 "13/80/34"
    print_osc4 3 "ff/cb/3e"
    print_osc4 4 "00/6b/b3"
    print_osc4 5 "6b/27/75"
    print_osc4 6 "38/45/64"
    print_osc4 7 "ed/ed/ed"
    print_osc4 8 "5d/50/4a"
    print_osc4 9 "f0/7e/18"
    print_osc4 10 "b1/d1/30"
    print_osc4 11 "ff/f1/20"
    print_osc4 12 "4f/c2/fd"
    print_osc4 13 "de/00/71"
    print_osc4 14 "5d/50/4a"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ed/ed/ed"
    print_osc_rgb 11 "22/22/25"
    print_osc_rgb 12 "ed/ed/ed"
    print_osc_rgb 17 "ed/ed/ed"
    print_osc_rgb 19 "22/22/25"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d00e18"
    print_linux 2 "#138034"
    print_linux 3 "#ffcb3e"
    print_linux 4 "#006bb3"
    print_linux 5 "#6b2775"
    print_linux 6 "#384564"
    print_linux 7 "#ededed"
    print_linux 8 "#5d504a"
    print_linux 9 "#f07e18"
    print_linux 10 "#b1d130"
    print_linux 11 "#fff120"
    print_linux 12 "#4fc2fd"
    print_linux 13 "#de0071"
    print_linux 14 "#5d504a"
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
