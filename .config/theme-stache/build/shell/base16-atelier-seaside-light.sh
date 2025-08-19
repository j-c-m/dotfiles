#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Seaside Light
# Author:   Bram de Haan (http://atelierbramdehaan.nl)
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
    print_osc4 0 "f4/fb/f4"
    print_osc4 1 "e6/19/3c"
    print_osc4 2 "29/a3/29"
    print_osc4 3 "98/98/1b"
    print_osc4 4 "3d/62/f5"
    print_osc4 5 "ad/2b/ee"
    print_osc4 6 "19/99/b3"
    print_osc4 7 "5e/6e/5e"
    print_osc4 8 "80/99/80"
    print_osc4 9 "e6/19/3c"
    print_osc4 10 "29/a3/29"
    print_osc4 11 "98/98/1b"
    print_osc4 12 "3d/62/f5"
    print_osc4 13 "ad/2b/ee"
    print_osc4 14 "19/99/b3"
    print_osc4 15 "13/15/13"

    print_osc_rgb 10 "5e/6e/5e"
    print_osc_rgb 11 "f4/fb/f4"
    print_osc_rgb 12 "5e/6e/5e"
    print_osc_rgb 17 "24/29/24"
    print_osc_rgb 19 "cf/e8/cf"
}

do_linux() {
    print_linux 0 "#f4fbf4"
    print_linux 1 "#e6193c"
    print_linux 2 "#29a329"
    print_linux 3 "#98981b"
    print_linux 4 "#3d62f5"
    print_linux 5 "#ad2bee"
    print_linux 6 "#1999b3"
    print_linux 7 "#5e6e5e"
    print_linux 8 "#809980"
    print_linux 9 "#e6193c"
    print_linux 10 "#29a329"
    print_linux 11 "#98981b"
    print_linux 12 "#3d62f5"
    print_linux 13 "#ad2bee"
    print_linux 14 "#1999b3"
    print_linux 15 "#131513"
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
