#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Rift
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "16/2c/22"
    print_osc4 1 "c1/99/04"
    print_osc4 2 "34/b5/34"
    print_osc4 3 "7f/ad/00"
    print_osc4 4 "30/ae/b0"
    print_osc4 5 "c8/95/4c"
    print_osc4 6 "5f/ad/8f"
    print_osc4 7 "ab/9a/a9"
    print_osc4 8 "28/34/31"
    print_osc4 9 "d2/a6/34"
    print_osc4 10 "6a/c1/34"
    print_osc4 11 "82/bd/00"
    print_osc4 12 "56/bd/ad"
    print_osc4 13 "cc/a0/ba"
    print_osc4 14 "10/c4/80"
    print_osc4 15 "bb/bc/bc"

    print_osc_rgb 10 "bb/bc/bc"
    print_osc_rgb 11 "16/2c/22"
    print_osc_rgb 12 "bb/bc/bc"
    print_osc_rgb 17 "bb/bc/bc"
    print_osc_rgb 19 "16/2c/22"
}

do_linux() {
    print_linux 0 "#162c22"
    print_linux 1 "#c19904"
    print_linux 2 "#34b534"
    print_linux 3 "#7fad00"
    print_linux 4 "#30aeb0"
    print_linux 5 "#c8954c"
    print_linux 6 "#5fad8f"
    print_linux 7 "#bbbcbc"
    print_linux 8 "#283431"
    print_linux 9 "#d2a634"
    print_linux 10 "#6ac134"
    print_linux 11 "#82bd00"
    print_linux 12 "#56bdad"
    print_linux 13 "#cca0ba"
    print_linux 14 "#10c480"
    print_linux 15 "#bbbcbc"
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
