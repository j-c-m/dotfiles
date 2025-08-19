#!/usr/bin/env bash

# Source:   gogh
# Theme:    Toy Chest
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
    print_osc4 0 "2c/3f/58"
    print_osc4 1 "be/2d/26"
    print_osc4 2 "1a/91/72"
    print_osc4 3 "db/8e/27"
    print_osc4 4 "32/5d/96"
    print_osc4 5 "8a/5e/dc"
    print_osc4 6 "35/a0/8f"
    print_osc4 7 "23/d1/83"
    print_osc4 8 "33/68/89"
    print_osc4 9 "dd/59/44"
    print_osc4 10 "31/d0/7b"
    print_osc4 11 "e7/d8/4b"
    print_osc4 12 "34/a6/da"
    print_osc4 13 "ae/6b/dc"
    print_osc4 14 "42/c3/ae"
    print_osc4 15 "d5/d5/d5"

    print_osc_rgb 10 "31/d0/7b"
    print_osc_rgb 11 "24/36/4b"
    print_osc_rgb 12 "31/d0/7b"
    print_osc_rgb 17 "31/d0/7b"
    print_osc_rgb 19 "24/36/4b"
}

do_linux() {
    print_linux 0 "#2c3f58"
    print_linux 1 "#be2d26"
    print_linux 2 "#1a9172"
    print_linux 3 "#db8e27"
    print_linux 4 "#325d96"
    print_linux 5 "#8a5edc"
    print_linux 6 "#35a08f"
    print_linux 7 "#31d07b"
    print_linux 8 "#336889"
    print_linux 9 "#dd5944"
    print_linux 10 "#31d07b"
    print_linux 11 "#e7d84b"
    print_linux 12 "#34a6da"
    print_linux 13 "#ae6bdc"
    print_linux 14 "#42c3ae"
    print_linux 15 "#d5d5d5"
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
