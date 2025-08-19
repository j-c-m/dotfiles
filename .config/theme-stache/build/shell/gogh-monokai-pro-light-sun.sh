#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Pro Light Sun
# Author:   
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
    print_osc4 0 "fd/f7/f3"
    print_osc4 1 "ce/47/70"
    print_osc4 2 "21/88/71"
    print_osc4 3 "b1/68/03"
    print_osc4 4 "d4/57/2b"
    print_osc4 5 "68/51/a2"
    print_osc4 6 "24/73/b6"
    print_osc4 7 "2c/23/2e"
    print_osc4 8 "59/54/51"
    print_osc4 9 "ce/47/70"
    print_osc4 10 "21/88/71"
    print_osc4 11 "b1/68/03"
    print_osc4 12 "d4/57/2b"
    print_osc4 13 "68/51/a2"
    print_osc4 14 "24/73/b6"
    print_osc4 15 "2c/23/2e"

    print_osc_rgb 10 "2c/23/2e"
    print_osc_rgb 11 "fd/f7/f3"
    print_osc_rgb 12 "2c/23/2e"
    print_osc_rgb 17 "2c/23/2e"
    print_osc_rgb 19 "fd/f7/f3"
}

do_linux() {
    print_linux 0 "#fdf7f3"
    print_linux 1 "#ce4770"
    print_linux 2 "#218871"
    print_linux 3 "#b16803"
    print_linux 4 "#d4572b"
    print_linux 5 "#6851a2"
    print_linux 6 "#2473b6"
    print_linux 7 "#2c232e"
    print_linux 8 "#595451"
    print_linux 9 "#ce4770"
    print_linux 10 "#218871"
    print_linux 11 "#b16803"
    print_linux 12 "#d4572b"
    print_linux 13 "#6851a2"
    print_linux 14 "#2473b6"
    print_linux 15 "#2c232e"
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
