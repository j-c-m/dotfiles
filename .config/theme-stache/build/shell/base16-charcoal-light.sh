#!/usr/bin/env bash

# Source:   base16
# Theme:    Charcoal Light
# Author:   Mubin Muhammad (https://github.com/mubin6th)
# Variant:  light

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
    print_osc4 0 "d6/b8/91"
    print_osc4 1 "41/33/25"
    print_osc4 2 "12/0f/09"
    print_osc4 3 "29/20/16"
    print_osc4 4 "12/0f/09"
    print_osc4 5 "29/20/16"
    print_osc4 6 "41/33/25"
    print_osc4 7 "35/29/1d"
    print_osc4 8 "88/72/54"
    print_osc4 9 "41/33/25"
    print_osc4 10 "12/0f/09"
    print_osc4 11 "29/20/16"
    print_osc4 12 "12/0f/09"
    print_osc4 13 "29/20/16"
    print_osc4 14 "41/33/25"
    print_osc4 15 "d6/b8/91"

    print_osc_rgb 10 "35/29/1d"
    print_osc_rgb 11 "d6/b8/91"
    print_osc_rgb 12 "35/29/1d"
    print_osc_rgb 17 "41/33/25"
    print_osc_rgb 19 "c0/a1/79"
}

do_linux() {
    print_linux 0 "#d6b891"
    print_linux 1 "#413325"
    print_linux 2 "#120f09"
    print_linux 3 "#292016"
    print_linux 4 "#120f09"
    print_linux 5 "#292016"
    print_linux 6 "#413325"
    print_linux 7 "#35291d"
    print_linux 8 "#887254"
    print_linux 9 "#413325"
    print_linux 10 "#120f09"
    print_linux 11 "#292016"
    print_linux 12 "#120f09"
    print_linux 13 "#292016"
    print_linux 14 "#413325"
    print_linux 15 "#d6b891"
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
