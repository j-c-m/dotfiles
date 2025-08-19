#!/usr/bin/env bash

# Source:   gogh
# Theme:    Birds Of Paradise
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "57/3d/26"
    print_osc4 1 "be/2d/26"
    print_osc4 2 "6b/a1/8a"
    print_osc4 3 "e9/9d/2a"
    print_osc4 4 "5a/86/ad"
    print_osc4 5 "ac/80/a6"
    print_osc4 6 "74/a6/ad"
    print_osc4 7 "e0/db/b7"
    print_osc4 8 "9b/6c/4a"
    print_osc4 9 "e8/46/27"
    print_osc4 10 "95/d8/ba"
    print_osc4 11 "d0/d1/50"
    print_osc4 12 "b8/d3/ed"
    print_osc4 13 "d1/9e/cb"
    print_osc4 14 "93/cf/d7"
    print_osc4 15 "ff/f9/d5"

    print_osc_rgb 10 "e0/db/b7"
    print_osc_rgb 11 "2a/1f/1d"
    print_osc_rgb 12 "e0/db/b7"
    print_osc_rgb 17 "e0/db/b7"
    print_osc_rgb 19 "2a/1f/1d"
}

do_linux() {
    print_linux 0 "#573d26"
    print_linux 1 "#be2d26"
    print_linux 2 "#6ba18a"
    print_linux 3 "#e99d2a"
    print_linux 4 "#5a86ad"
    print_linux 5 "#ac80a6"
    print_linux 6 "#74a6ad"
    print_linux 7 "#e0dbb7"
    print_linux 8 "#9b6c4a"
    print_linux 9 "#e84627"
    print_linux 10 "#95d8ba"
    print_linux 11 "#d0d150"
    print_linux 12 "#b8d3ed"
    print_linux 13 "#d19ecb"
    print_linux 14 "#93cfd7"
    print_linux 15 "#fff9d5"
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
