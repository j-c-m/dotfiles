#!/usr/bin/env bash

# Source:   base16
# Theme:    Equilibrium Gray Light
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
    print_osc4 0 "f1/f1/f1"
    print_osc4 1 "d0/20/23"
    print_osc4 2 "63/72/00"
    print_osc4 3 "9d/6f/00"
    print_osc4 4 "00/73/b5"
    print_osc4 5 "4e/66/b6"
    print_osc4 6 "00/7a/72"
    print_osc4 7 "47/47/47"
    print_osc4 8 "77/77/77"
    print_osc4 9 "d0/20/23"
    print_osc4 10 "63/72/00"
    print_osc4 11 "9d/6f/00"
    print_osc4 12 "00/73/b5"
    print_osc4 13 "4e/66/b6"
    print_osc4 14 "00/7a/72"
    print_osc4 15 "1b/1b/1b"

    print_osc_rgb 10 "47/47/47"
    print_osc_rgb 11 "f1/f1/f1"
    print_osc_rgb 12 "47/47/47"
    print_osc_rgb 17 "30/30/30"
    print_osc_rgb 19 "e2/e2/e2"
}

do_linux() {
    print_linux 0 "#f1f1f1"
    print_linux 1 "#d02023"
    print_linux 2 "#637200"
    print_linux 3 "#9d6f00"
    print_linux 4 "#0073b5"
    print_linux 5 "#4e66b6"
    print_linux 6 "#007a72"
    print_linux 7 "#474747"
    print_linux 8 "#777777"
    print_linux 9 "#d02023"
    print_linux 10 "#637200"
    print_linux 11 "#9d6f00"
    print_linux 12 "#0073b5"
    print_linux 13 "#4e66b6"
    print_linux 14 "#007a72"
    print_linux 15 "#1b1b1b"
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
