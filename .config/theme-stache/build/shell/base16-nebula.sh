#!/usr/bin/env bash

# Source:   base16
# Theme:    Nebula
# Author:   Gabriel Fontes (https://github.com/Misterio77)
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
    print_osc4 0 "22/27/3b"
    print_osc4 1 "77/7a/bc"
    print_osc4 2 "65/62/a8"
    print_osc4 3 "4f/90/62"
    print_osc4 4 "4d/6b/b6"
    print_osc4 5 "71/6c/ae"
    print_osc4 6 "22/6f/68"
    print_osc4 7 "a4/a6/a9"
    print_osc4 8 "6e/6f/72"
    print_osc4 9 "77/7a/bc"
    print_osc4 10 "65/62/a8"
    print_osc4 11 "4f/90/62"
    print_osc4 12 "4d/6b/b6"
    print_osc4 13 "71/6c/ae"
    print_osc4 14 "22/6f/68"
    print_osc4 15 "8d/bd/aa"

    print_osc_rgb 10 "a4/a6/a9"
    print_osc_rgb 11 "22/27/3b"
    print_osc_rgb 12 "a4/a6/a9"
    print_osc_rgb 17 "c7/c9/cd"
    print_osc_rgb 19 "41/4f/60"
}

do_linux() {
    print_linux 0 "#22273b"
    print_linux 1 "#777abc"
    print_linux 2 "#6562a8"
    print_linux 3 "#4f9062"
    print_linux 4 "#4d6bb6"
    print_linux 5 "#716cae"
    print_linux 6 "#226f68"
    print_linux 7 "#a4a6a9"
    print_linux 8 "#6e6f72"
    print_linux 9 "#777abc"
    print_linux 10 "#6562a8"
    print_linux 11 "#4f9062"
    print_linux 12 "#4d6bb6"
    print_linux 13 "#716cae"
    print_linux 14 "#226f68"
    print_linux 15 "#8dbdaa"
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
