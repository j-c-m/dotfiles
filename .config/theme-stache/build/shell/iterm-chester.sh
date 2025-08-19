#!/usr/bin/env bash

# Source:   iterm
# Theme:    Chester
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "08/02/00"
    print_osc4 1 "fa/5e/5b"
    print_osc4 2 "16/c9/8d"
    print_osc4 3 "ff/c8/3f"
    print_osc4 4 "28/8a/d6"
    print_osc4 5 "d3/45/90"
    print_osc4 6 "28/dd/de"
    print_osc4 7 "e7/e7/e7"
    print_osc4 8 "6f/6b/67"
    print_osc4 9 "fa/5e/5b"
    print_osc4 10 "16/c9/8d"
    print_osc4 11 "fe/ef/6d"
    print_osc4 12 "27/8a/d6"
    print_osc4 13 "d3/45/90"
    print_osc4 14 "27/de/de"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "2c/36/43"
    print_osc_rgb 12 "b4/b1/b1"
    print_osc_rgb 17 "67/74/7c"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#080200"
    print_linux 1 "#fa5e5b"
    print_linux 2 "#16c98d"
    print_linux 3 "#ffc83f"
    print_linux 4 "#288ad6"
    print_linux 5 "#d34590"
    print_linux 6 "#28ddde"
    print_linux 7 "#ffffff"
    print_linux 8 "#6f6b67"
    print_linux 9 "#fa5e5b"
    print_linux 10 "#16c98d"
    print_linux 11 "#feef6d"
    print_linux 12 "#278ad6"
    print_linux 13 "#d34590"
    print_linux 14 "#27dede"
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
