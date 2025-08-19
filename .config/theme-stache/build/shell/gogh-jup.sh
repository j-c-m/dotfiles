#!/usr/bin/env bash

# Source:   gogh
# Theme:    Jup
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "dd/00/6f"
    print_osc4 2 "6f/dd/00"
    print_osc4 3 "dd/6f/00"
    print_osc4 4 "00/6f/dd"
    print_osc4 5 "6f/00/dd"
    print_osc4 6 "00/dd/6f"
    print_osc4 7 "f2/f2/f2"
    print_osc4 8 "7d/7d/7d"
    print_osc4 9 "ff/74/b9"
    print_osc4 10 "b9/ff/74"
    print_osc4 11 "ff/b9/74"
    print_osc4 12 "74/b9/ff"
    print_osc4 13 "b9/74/ff"
    print_osc4 14 "74/ff/b9"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "23/47/6a"
    print_osc_rgb 11 "75/84/80"
    print_osc_rgb 12 "23/47/6a"
    print_osc_rgb 17 "23/47/6a"
    print_osc_rgb 19 "75/84/80"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#dd006f"
    print_linux 2 "#6fdd00"
    print_linux 3 "#dd6f00"
    print_linux 4 "#006fdd"
    print_linux 5 "#6f00dd"
    print_linux 6 "#00dd6f"
    print_linux 7 "#23476a"
    print_linux 8 "#7d7d7d"
    print_linux 9 "#ff74b9"
    print_linux 10 "#b9ff74"
    print_linux 11 "#ffb974"
    print_linux 12 "#74b9ff"
    print_linux 13 "#b974ff"
    print_linux 14 "#74ffb9"
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
