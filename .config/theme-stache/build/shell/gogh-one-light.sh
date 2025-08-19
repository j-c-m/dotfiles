#!/usr/bin/env bash

# Source:   gogh
# Theme:    One Light
# Author:   
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "da/3e/39"
    print_osc4 2 "41/93/3e"
    print_osc4 3 "85/55/04"
    print_osc4 4 "31/5e/ee"
    print_osc4 5 "93/00/92"
    print_osc4 6 "0e/6f/ad"
    print_osc4 7 "8e/8f/96"
    print_osc4 8 "2a/2b/32"
    print_osc4 9 "da/3e/39"
    print_osc4 10 "41/93/3e"
    print_osc4 11 "85/55/04"
    print_osc4 12 "31/5e/ee"
    print_osc4 13 "93/00/92"
    print_osc4 14 "0e/6f/ad"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "2a/2b/32"
    print_osc_rgb 11 "f8/f8/f8"
    print_osc_rgb 12 "2a/2b/32"
    print_osc_rgb 17 "2a/2b/32"
    print_osc_rgb 19 "f8/f8/f8"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#da3e39"
    print_linux 2 "#41933e"
    print_linux 3 "#855504"
    print_linux 4 "#315eee"
    print_linux 5 "#930092"
    print_linux 6 "#0e6fad"
    print_linux 7 "#2a2b32"
    print_linux 8 "#2a2b32"
    print_linux 9 "#da3e39"
    print_linux 10 "#41933e"
    print_linux 11 "#855504"
    print_linux 12 "#315eee"
    print_linux 13 "#930092"
    print_linux 14 "#0e6fad"
    print_linux 15 "#fffefe"
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
