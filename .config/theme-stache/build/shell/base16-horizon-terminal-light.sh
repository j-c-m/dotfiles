#!/usr/bin/env bash

# Source:   base16
# Theme:    Horizon Terminal Light
# Author:   Michaël Ball (http://github.com/michael-ball/)
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
    print_osc4 0 "fd/f0/ed"
    print_osc4 1 "e9/56/78"
    print_osc4 2 "29/d3/98"
    print_osc4 3 "fa/da/d1"
    print_osc4 4 "26/bb/d9"
    print_osc4 5 "ee/64/ac"
    print_osc4 6 "59/e1/e3"
    print_osc4 7 "40/3c/3d"
    print_osc4 8 "bd/b3/b1"
    print_osc4 9 "e9/56/78"
    print_osc4 10 "29/d3/98"
    print_osc4 11 "fa/da/d1"
    print_osc4 12 "26/bb/d9"
    print_osc4 13 "ee/64/ac"
    print_osc4 14 "59/e1/e3"
    print_osc4 15 "20/1c/1d"

    print_osc_rgb 10 "40/3c/3d"
    print_osc_rgb 11 "fd/f0/ed"
    print_osc_rgb 12 "40/3c/3d"
    print_osc_rgb 17 "30/2c/2d"
    print_osc_rgb 19 "fa/da/d1"
}

do_linux() {
    print_linux 0 "#fdf0ed"
    print_linux 1 "#e95678"
    print_linux 2 "#29d398"
    print_linux 3 "#fadad1"
    print_linux 4 "#26bbd9"
    print_linux 5 "#ee64ac"
    print_linux 6 "#59e1e3"
    print_linux 7 "#403c3d"
    print_linux 8 "#bdb3b1"
    print_linux 9 "#e95678"
    print_linux 10 "#29d398"
    print_linux 11 "#fadad1"
    print_linux 12 "#26bbd9"
    print_linux 13 "#ee64ac"
    print_linux 14 "#59e1e3"
    print_linux 15 "#201c1d"
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
