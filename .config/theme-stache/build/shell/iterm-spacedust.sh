#!/usr/bin/env bash

# Source:   iterm
# Theme:    Spacedust
# Author:   unknown
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
    print_osc4 0 "6e/52/46"
    print_osc4 1 "e3/5a/00"
    print_osc4 2 "5c/ab/96"
    print_osc4 3 "e3/cd/7b"
    print_osc4 4 "0e/54/8b"
    print_osc4 5 "e3/5a/00"
    print_osc4 6 "06/af/c7"
    print_osc4 7 "f0/f1/ce"
    print_osc4 8 "67/4c/31"
    print_osc4 9 "ff/8a/39"
    print_osc4 10 "ad/ca/b8"
    print_osc4 11 "ff/c7/77"
    print_osc4 12 "67/a0/cd"
    print_osc4 13 "ff/8a/39"
    print_osc4 14 "83/a6/b3"
    print_osc4 15 "fe/ff/f0"

    print_osc_rgb 10 "ec/ef/c1"
    print_osc_rgb 11 "0a/1e/24"
    print_osc_rgb 12 "70/81/83"
    print_osc_rgb 17 "0a/38/5c"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#6e5246"
    print_linux 1 "#e35a00"
    print_linux 2 "#5cab96"
    print_linux 3 "#e3cd7b"
    print_linux 4 "#0e548b"
    print_linux 5 "#e35a00"
    print_linux 6 "#06afc7"
    print_linux 7 "#ecefc1"
    print_linux 8 "#674c31"
    print_linux 9 "#ff8a39"
    print_linux 10 "#adcab8"
    print_linux 11 "#ffc777"
    print_linux 12 "#67a0cd"
    print_linux 13 "#ff8a39"
    print_linux 14 "#83a6b3"
    print_linux 15 "#fefff0"
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
