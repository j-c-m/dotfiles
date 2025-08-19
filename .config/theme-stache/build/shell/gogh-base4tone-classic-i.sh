#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic I
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
    print_osc4 0 "1d/20/1d"
    print_osc4 1 "5c/6f/eb"
    print_osc4 2 "91/a4/04"
    print_osc4 3 "c5/dc/18"
    print_osc4 4 "24/cc/38"
    print_osc4 5 "23/b4/c7"
    print_osc4 6 "ad/c1/15"
    print_osc4 7 "e8/ed/e9"
    print_osc4 8 "08/0d/08"
    print_osc4 9 "92/9f/f7"
    print_osc4 10 "ce/e6/1a"
    print_osc4 11 "e6/f2/8c"
    print_osc4 12 "b5/f2/bc"
    print_osc4 13 "3c/ca/dd"
    print_osc4 14 "97/ed/a1"
    print_osc4 15 "f6/f9/f6"

    print_osc_rgb 10 "94/9e/95"
    print_osc_rgb 11 "1d/20/1d"
    print_osc_rgb 12 "83/85/6f"
    print_osc_rgb 17 "94/9e/95"
    print_osc_rgb 19 "1d/20/1d"
}

do_linux() {
    print_linux 0 "#1d201d"
    print_linux 1 "#5c6feb"
    print_linux 2 "#91a404"
    print_linux 3 "#c5dc18"
    print_linux 4 "#24cc38"
    print_linux 5 "#23b4c7"
    print_linux 6 "#adc115"
    print_linux 7 "#949e95"
    print_linux 8 "#080d08"
    print_linux 9 "#929ff7"
    print_linux 10 "#cee61a"
    print_linux 11 "#e6f28c"
    print_linux 12 "#b5f2bc"
    print_linux 13 "#3ccadd"
    print_linux 14 "#97eda1"
    print_linux 15 "#f6f9f6"
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
