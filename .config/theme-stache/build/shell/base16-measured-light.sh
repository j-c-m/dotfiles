#!/usr/bin/env bash

# Source:   base16
# Theme:    Measured Light
# Author:   Measured (https://measured.co)
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
    print_osc4 0 "fd/f9/f5"
    print_osc4 1 "ac/1f/35"
    print_osc4 2 "0c/68/0c"
    print_osc4 3 "64/5a/00"
    print_osc4 4 "01/58/ad"
    print_osc4 5 "66/45/c2"
    print_osc4 6 "01/71/6f"
    print_osc4 7 "29/29/29"
    print_osc4 8 "5a/5a/5a"
    print_osc4 9 "ac/1f/35"
    print_osc4 10 "0c/68/0c"
    print_osc4 11 "64/5a/00"
    print_osc4 12 "01/58/ad"
    print_osc4 13 "66/45/c2"
    print_osc4 14 "01/71/6f"
    print_osc4 15 "00/00/00"

    print_osc_rgb 10 "29/29/29"
    print_osc_rgb 11 "fd/f9/f5"
    print_osc_rgb 12 "29/29/29"
    print_osc_rgb 17 "18/18/18"
    print_osc_rgb 19 "f9/f5/f1"
}

do_linux() {
    print_linux 0 "#fdf9f5"
    print_linux 1 "#ac1f35"
    print_linux 2 "#0c680c"
    print_linux 3 "#645a00"
    print_linux 4 "#0158ad"
    print_linux 5 "#6645c2"
    print_linux 6 "#01716f"
    print_linux 7 "#292929"
    print_linux 8 "#5a5a5a"
    print_linux 9 "#ac1f35"
    print_linux 10 "#0c680c"
    print_linux 11 "#645a00"
    print_linux 12 "#0158ad"
    print_linux 13 "#6645c2"
    print_linux 14 "#01716f"
    print_linux 15 "#000000"
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
