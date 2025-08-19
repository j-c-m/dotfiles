#!/usr/bin/env bash

# Source:   iterm
# Theme:    Mathias
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
    print_osc4 1 "e5/22/22"
    print_osc4 2 "a6/e3/2d"
    print_osc4 3 "fc/95/1e"
    print_osc4 4 "c4/8d/ff"
    print_osc4 5 "fa/25/73"
    print_osc4 6 "67/d9/f0"
    print_osc4 7 "f2/f2/f2"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/55/55"
    print_osc4 10 "55/ff/55"
    print_osc4 11 "ff/ff/55"
    print_osc4 12 "55/55/ff"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "55/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bb/bb/bb"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "55/55/55"
    print_osc_rgb 19 "f2/f2/f2"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e52222"
    print_linux 2 "#a6e32d"
    print_linux 3 "#fc951e"
    print_linux 4 "#c48dff"
    print_linux 5 "#fa2573"
    print_linux 6 "#67d9f0"
    print_linux 7 "#bbbbbb"
    print_linux 8 "#555555"
    print_linux 9 "#ff5555"
    print_linux 10 "#55ff55"
    print_linux 11 "#ffff55"
    print_linux 12 "#5555ff"
    print_linux 13 "#ff55ff"
    print_linux 14 "#55ffff"
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
