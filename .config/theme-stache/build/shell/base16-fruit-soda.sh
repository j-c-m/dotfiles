#!/usr/bin/env bash

# Source:   base16
# Theme:    Fruit Soda
# Author:   jozip
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
    print_osc4 0 "f1/ec/f1"
    print_osc4 1 "fe/3e/31"
    print_osc4 2 "47/f7/4c"
    print_osc4 3 "f7/e2/03"
    print_osc4 4 "29/31/df"
    print_osc4 5 "61/1f/ce"
    print_osc4 6 "0f/9c/fd"
    print_osc4 7 "51/51/51"
    print_osc4 8 "b5/b4/b6"
    print_osc4 9 "fe/3e/31"
    print_osc4 10 "47/f7/4c"
    print_osc4 11 "f7/e2/03"
    print_osc4 12 "29/31/df"
    print_osc4 13 "61/1f/ce"
    print_osc4 14 "0f/9c/fd"
    print_osc4 15 "2d/2c/2c"

    print_osc_rgb 10 "51/51/51"
    print_osc_rgb 11 "f1/ec/f1"
    print_osc_rgb 12 "51/51/51"
    print_osc_rgb 17 "47/45/45"
    print_osc_rgb 19 "e0/de/e0"
}

do_linux() {
    print_linux 0 "#f1ecf1"
    print_linux 1 "#fe3e31"
    print_linux 2 "#47f74c"
    print_linux 3 "#f7e203"
    print_linux 4 "#2931df"
    print_linux 5 "#611fce"
    print_linux 6 "#0f9cfd"
    print_linux 7 "#515151"
    print_linux 8 "#b5b4b6"
    print_linux 9 "#fe3e31"
    print_linux 10 "#47f74c"
    print_linux 11 "#f7e203"
    print_linux 12 "#2931df"
    print_linux 13 "#611fce"
    print_linux 14 "#0f9cfd"
    print_linux 15 "#2d2c2c"
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
