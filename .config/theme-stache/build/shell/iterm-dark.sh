#!/usr/bin/env bash

# Source:   iterm
# Theme:    Dark+
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cd/31/31"
    print_osc4 2 "0d/bc/79"
    print_osc4 3 "e5/e5/10"
    print_osc4 4 "24/72/c8"
    print_osc4 5 "bc/3f/bc"
    print_osc4 6 "11/a8/cd"
    print_osc4 7 "e5/e5/e5"
    print_osc4 8 "66/66/66"
    print_osc4 9 "f1/4c/4c"
    print_osc4 10 "23/d1/8b"
    print_osc4 11 "f5/f5/43"
    print_osc4 12 "3b/8e/ea"
    print_osc4 13 "d6/70/d6"
    print_osc4 14 "29/b8/db"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "1e/1e/1e"
    print_osc_rgb 12 "fe/ff/ff"
    print_osc_rgb 17 "3a/3d/41"
    print_osc_rgb 19 "e0/e0/e0"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cd3131"
    print_linux 2 "#0dbc79"
    print_linux 3 "#e5e510"
    print_linux 4 "#2472c8"
    print_linux 5 "#bc3fbc"
    print_linux 6 "#11a8cd"
    print_linux 7 "#cccccc"
    print_linux 8 "#666666"
    print_linux 9 "#f14c4c"
    print_linux 10 "#23d18b"
    print_linux 11 "#f5f543"
    print_linux 12 "#3b8eea"
    print_linux 13 "#d670d6"
    print_linux 14 "#29b8db"
    print_linux 15 "#e5e5e5"
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
