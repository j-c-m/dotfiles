#!/usr/bin/env bash

# Source:   base24
# Theme:    Brogrammer
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "13/13/13"
    print_osc4 1 "f7/11/18"
    print_osc4 2 "2c/c5/5d"
    print_osc4 3 "0f/80/d5"
    print_osc4 4 "2a/84/d2"
    print_osc4 5 "4e/59/b7"
    print_osc4 6 "0f/80/d5"
    print_osc4 7 "c1/c8/d7"
    print_osc4 8 "34/3d/50"
    print_osc4 9 "de/34/2e"
    print_osc4 10 "1d/d2/60"
    print_osc4 11 "f2/bd/09"
    print_osc4 12 "50/9b/dc"
    print_osc4 13 "52/4f/b9"
    print_osc4 14 "28/9a/f0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c1/c8/d7"
    print_osc_rgb 11 "13/13/13"
    print_osc_rgb 12 "c1/c8/d7"
    print_osc_rgb 17 "e3/e6/ed"
    print_osc_rgb 19 "1f/1f/1f"
}

do_linux() {
    print_linux 0 "#131313"
    print_linux 1 "#f71118"
    print_linux 2 "#2cc55d"
    print_linux 3 "#0f80d5"
    print_linux 4 "#2a84d2"
    print_linux 5 "#4e59b7"
    print_linux 6 "#0f80d5"
    print_linux 7 "#c1c8d7"
    print_linux 8 "#343d50"
    print_linux 9 "#de342e"
    print_linux 10 "#1dd260"
    print_linux 11 "#f2bd09"
    print_linux 12 "#509bdc"
    print_linux 13 "#524fb9"
    print_linux 14 "#289af0"
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
