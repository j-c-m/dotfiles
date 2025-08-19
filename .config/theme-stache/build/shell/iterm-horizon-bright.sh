#!/usr/bin/env bash

# Source:   iterm
# Theme:    Horizon-Bright
# Author:   unknown
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
    print_osc4 0 "16/15/1c"
    print_osc4 1 "fc/46/76"
    print_osc4 2 "00/d6/93"
    print_osc4 3 "fe/b3/8e"
    print_osc4 4 "00/be/dc"
    print_osc4 5 "fe/57/b0"
    print_osc4 6 "00/e6/e4"
    print_osc4 7 "fe/ef/ec"
    print_osc4 8 "19/1c/23"
    print_osc4 9 "fe/5f/87"
    print_osc4 10 "00/dd/a0"
    print_osc4 11 "fe/c0/a2"
    print_osc4 12 "00/c9/e1"
    print_osc4 13 "fe/6b/b9"
    print_osc4 14 "07/e9/e7"
    print_osc4 15 "fe/f2/ef"

    print_osc_rgb 10 "16/15/1c"
    print_osc_rgb 11 "fd/ef/ec"
    print_osc_rgb 12 "f9/cd/c2"
    print_osc_rgb 17 "f9/cd/c2"
    print_osc_rgb 19 "16/15/1c"
}

do_linux() {
    print_linux 0 "#16151c"
    print_linux 1 "#fc4676"
    print_linux 2 "#00d693"
    print_linux 3 "#feb38e"
    print_linux 4 "#00bedc"
    print_linux 5 "#fe57b0"
    print_linux 6 "#00e6e4"
    print_linux 7 "#16151c"
    print_linux 8 "#191c23"
    print_linux 9 "#fe5f87"
    print_linux 10 "#00dda0"
    print_linux 11 "#fec0a2"
    print_linux 12 "#00c9e1"
    print_linux 13 "#fe6bb9"
    print_linux 14 "#07e9e7"
    print_linux 15 "#fef2ef"
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
