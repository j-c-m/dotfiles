#!/usr/bin/env bash

# Source:   base16
# Theme:    Humanoid light
# Author:   Thomas (tasmo) Friese
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
    print_osc4 0 "f8/f8/f2"
    print_osc4 1 "b0/15/1a"
    print_osc4 2 "38/8e/3c"
    print_osc4 3 "ff/b6/27"
    print_osc4 4 "00/82/c9"
    print_osc4 5 "70/0f/98"
    print_osc4 6 "00/8e/8e"
    print_osc4 7 "23/26/29"
    print_osc4 8 "c0/c0/bd"
    print_osc4 9 "b0/15/1a"
    print_osc4 10 "38/8e/3c"
    print_osc4 11 "ff/b6/27"
    print_osc4 12 "00/82/c9"
    print_osc4 13 "70/0f/98"
    print_osc4 14 "00/8e/8e"
    print_osc4 15 "07/07/08"

    print_osc_rgb 10 "23/26/29"
    print_osc_rgb 11 "f8/f8/f2"
    print_osc_rgb 12 "23/26/29"
    print_osc_rgb 17 "2f/33/37"
    print_osc_rgb 19 "ef/ef/e9"
}

do_linux() {
    print_linux 0 "#f8f8f2"
    print_linux 1 "#b0151a"
    print_linux 2 "#388e3c"
    print_linux 3 "#ffb627"
    print_linux 4 "#0082c9"
    print_linux 5 "#700f98"
    print_linux 6 "#008e8e"
    print_linux 7 "#232629"
    print_linux 8 "#c0c0bd"
    print_linux 9 "#b0151a"
    print_linux 10 "#388e3c"
    print_linux 11 "#ffb627"
    print_linux 12 "#0082c9"
    print_linux 13 "#700f98"
    print_linux 14 "#008e8e"
    print_linux 15 "#070708"
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
