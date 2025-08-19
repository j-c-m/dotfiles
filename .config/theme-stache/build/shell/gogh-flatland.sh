#!/usr/bin/env bash

# Source:   gogh
# Theme:    Flatland
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
    print_osc4 0 "1d/1d/19"
    print_osc4 1 "f1/83/39"
    print_osc4 2 "9f/d3/64"
    print_osc4 3 "f4/ef/6d"
    print_osc4 4 "50/96/be"
    print_osc4 5 "69/5a/bc"
    print_osc4 6 "d6/38/65"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "1d/1d/19"
    print_osc4 9 "d2/2a/24"
    print_osc4 10 "a7/d4/2c"
    print_osc4 11 "ff/89/49"
    print_osc4 12 "61/b9/d0"
    print_osc4 13 "69/5a/bc"
    print_osc4 14 "d6/38/65"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "b8/db/ef"
    print_osc_rgb 11 "1d/1f/21"
    print_osc_rgb 12 "b8/db/ef"
    print_osc_rgb 17 "b8/db/ef"
    print_osc_rgb 19 "1d/1f/21"
}

do_linux() {
    print_linux 0 "#1d1d19"
    print_linux 1 "#f18339"
    print_linux 2 "#9fd364"
    print_linux 3 "#f4ef6d"
    print_linux 4 "#5096be"
    print_linux 5 "#695abc"
    print_linux 6 "#d63865"
    print_linux 7 "#b8dbef"
    print_linux 8 "#1d1d19"
    print_linux 9 "#d22a24"
    print_linux 10 "#a7d42c"
    print_linux 11 "#ff8949"
    print_linux 12 "#61b9d0"
    print_linux 13 "#695abc"
    print_linux 14 "#d63865"
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
