#!/usr/bin/env bash

# Source:   base24
# Theme:    Lovelace
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
    print_osc4 0 "1d/1f/28"
    print_osc4 1 "f3/7f/97"
    print_osc4 2 "5a/de/cd"
    print_osc4 3 "55/6f/ff"
    print_osc4 4 "88/97/f4"
    print_osc4 5 "c5/74/dd"
    print_osc4 6 "79/e6/f3"
    print_osc4 7 "ce/ce/d3"
    print_osc4 8 "70/72/81"
    print_osc4 9 "ff/49/71"
    print_osc4 10 "18/e3/c8"
    print_osc4 11 "ff/80/37"
    print_osc4 12 "55/6f/ff"
    print_osc4 13 "b0/43/d1"
    print_osc4 14 "3f/dc/ee"
    print_osc4 15 "be/be/c1"

    print_osc_rgb 10 "ce/ce/d3"
    print_osc_rgb 11 "1d/1f/28"
    print_osc_rgb 12 "ce/ce/d3"
    print_osc_rgb 17 "fd/fd/fd"
    print_osc_rgb 19 "28/2a/36"
}

do_linux() {
    print_linux 0 "#1d1f28"
    print_linux 1 "#f37f97"
    print_linux 2 "#5adecd"
    print_linux 3 "#556fff"
    print_linux 4 "#8897f4"
    print_linux 5 "#c574dd"
    print_linux 6 "#79e6f3"
    print_linux 7 "#ceced3"
    print_linux 8 "#707281"
    print_linux 9 "#ff4971"
    print_linux 10 "#18e3c8"
    print_linux 11 "#ff8037"
    print_linux 12 "#556fff"
    print_linux 13 "#b043d1"
    print_linux 14 "#3fdcee"
    print_linux 15 "#bebec1"
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
