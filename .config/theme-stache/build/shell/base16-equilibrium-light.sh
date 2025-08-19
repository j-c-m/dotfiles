#!/usr/bin/env bash

# Source:   base16
# Theme:    Equilibrium Light
# Author:   Carlo Abelli
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
    print_osc4 0 "f5/f0/e7"
    print_osc4 1 "d0/20/23"
    print_osc4 2 "63/72/00"
    print_osc4 3 "9d/6f/00"
    print_osc4 4 "00/73/b5"
    print_osc4 5 "4e/66/b6"
    print_osc4 6 "00/7a/72"
    print_osc4 7 "43/47/4e"
    print_osc4 8 "73/77/7f"
    print_osc4 9 "d0/20/23"
    print_osc4 10 "63/72/00"
    print_osc4 11 "9d/6f/00"
    print_osc4 12 "00/73/b5"
    print_osc4 13 "4e/66/b6"
    print_osc4 14 "00/7a/72"
    print_osc4 15 "18/1c/22"

    print_osc_rgb 10 "43/47/4e"
    print_osc_rgb 11 "f5/f0/e7"
    print_osc_rgb 12 "43/47/4e"
    print_osc_rgb 17 "2c/31/38"
    print_osc_rgb 19 "e7/e2/d9"
}

do_linux() {
    print_linux 0 "#f5f0e7"
    print_linux 1 "#d02023"
    print_linux 2 "#637200"
    print_linux 3 "#9d6f00"
    print_linux 4 "#0073b5"
    print_linux 5 "#4e66b6"
    print_linux 6 "#007a72"
    print_linux 7 "#43474e"
    print_linux 8 "#73777f"
    print_linux 9 "#d02023"
    print_linux 10 "#637200"
    print_linux 11 "#9d6f00"
    print_linux 12 "#0073b5"
    print_linux 13 "#4e66b6"
    print_linux 14 "#007a72"
    print_linux 15 "#181c22"
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
