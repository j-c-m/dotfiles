#!/usr/bin/env bash

# Source:   iterm
# Theme:    Alabaster
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "aa/37/31"
    print_osc4 2 "44/8c/27"
    print_osc4 3 "cb/90/00"
    print_osc4 4 "32/5c/c0"
    print_osc4 5 "7a/3e/9d"
    print_osc4 6 "00/83/b2"
    print_osc4 7 "f7/f7/f7"
    print_osc4 8 "77/77/77"
    print_osc4 9 "f0/50/50"
    print_osc4 10 "60/cb/00"
    print_osc4 11 "ff/bc/5d"
    print_osc4 12 "00/7a/cc"
    print_osc4 13 "e6/4c/e6"
    print_osc4 14 "00/aa/cb"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "f7/f7/f7"
    print_osc_rgb 12 "00/7a/cc"
    print_osc_rgb 17 "bf/db/fe"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#aa3731"
    print_linux 2 "#448c27"
    print_linux 3 "#cb9000"
    print_linux 4 "#325cc0"
    print_linux 5 "#7a3e9d"
    print_linux 6 "#0083b2"
    print_linux 7 "#000000"
    print_linux 8 "#777777"
    print_linux 9 "#f05050"
    print_linux 10 "#60cb00"
    print_linux 11 "#ffbc5d"
    print_linux 12 "#007acc"
    print_linux 13 "#e64ce6"
    print_linux 14 "#00aacb"
    print_linux 15 "#f7f7f7"
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
