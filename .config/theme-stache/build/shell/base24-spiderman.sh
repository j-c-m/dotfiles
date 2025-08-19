#!/usr/bin/env bash

# Source:   base24
# Theme:    Spiderman
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "1b/1d/1e"
    print_osc4 1 "e6/07/12"
    print_osc4 2 "e2/28/28"
    print_osc4 3 "1d/4f/ff"
    print_osc4 4 "2b/3f/ff"
    print_osc4 5 "24/35/db"
    print_osc4 6 "32/55/ff"
    print_osc4 7 "d3/d3/cd"
    print_osc4 8 "7b/7d/7c"
    print_osc4 9 "ff/03/25"
    print_osc4 10 "ff/32/38"
    print_osc4 11 "fe/39/35"
    print_osc4 12 "1d/4f/ff"
    print_osc4 13 "73/7b/ff"
    print_osc4 14 "60/83/ff"
    print_osc4 15 "fe/ff/f9"

    print_osc_rgb 10 "d3/d3/cd"
    print_osc_rgb 11 "1b/1d/1e"
    print_osc_rgb 12 "d3/d3/cd"
    print_osc_rgb 17 "ff/fe/f6"
    print_osc_rgb 19 "1b/1d/1e"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#e60712"
    print_linux 2 "#e22828"
    print_linux 3 "#1d4fff"
    print_linux 4 "#2b3fff"
    print_linux 5 "#2435db"
    print_linux 6 "#3255ff"
    print_linux 7 "#d3d3cd"
    print_linux 8 "#7b7d7c"
    print_linux 9 "#ff0325"
    print_linux 10 "#ff3238"
    print_linux 11 "#fe3935"
    print_linux 12 "#1d4fff"
    print_linux 13 "#737bff"
    print_linux 14 "#6083ff"
    print_linux 15 "#fefff9"
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
