#!/usr/bin/env bash

# Source:   gogh
# Theme:    Spacegray
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
    print_osc4 1 "b0/4b/57"
    print_osc4 2 "87/b3/79"
    print_osc4 3 "e5/c1/79"
    print_osc4 4 "7d/8f/a4"
    print_osc4 5 "a4/79/96"
    print_osc4 6 "85/a7/a5"
    print_osc4 7 "b3/b8/c3"
    print_osc4 8 "00/00/00"
    print_osc4 9 "b0/4b/57"
    print_osc4 10 "87/b3/79"
    print_osc4 11 "e5/c1/79"
    print_osc4 12 "7d/8f/a4"
    print_osc4 13 "a4/79/96"
    print_osc4 14 "85/a7/a5"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "b3/b8/c3"
    print_osc_rgb 11 "20/24/2d"
    print_osc_rgb 12 "b3/b8/c3"
    print_osc_rgb 17 "b3/b8/c3"
    print_osc_rgb 19 "20/24/2d"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#b04b57"
    print_linux 2 "#87b379"
    print_linux 3 "#e5c179"
    print_linux 4 "#7d8fa4"
    print_linux 5 "#a47996"
    print_linux 6 "#85a7a5"
    print_linux 7 "#b3b8c3"
    print_linux 8 "#000000"
    print_linux 9 "#b04b57"
    print_linux 10 "#87b379"
    print_linux 11 "#e5c179"
    print_linux 12 "#7d8fa4"
    print_linux 13 "#a47996"
    print_linux 14 "#85a7a5"
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
