#!/usr/bin/env bash

# Source:   base16
# Theme:    selenized-light
# Author:   Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "fb/f3/db"
    print_osc4 1 "cc/17/29"
    print_osc4 2 "42/8b/00"
    print_osc4 3 "a7/83/00"
    print_osc4 4 "00/6d/ce"
    print_osc4 5 "82/5d/c0"
    print_osc4 6 "00/97/8a"
    print_osc4 7 "53/67/6d"
    print_osc4 8 "90/99/95"
    print_osc4 9 "cc/17/29"
    print_osc4 10 "42/8b/00"
    print_osc4 11 "a7/83/00"
    print_osc4 12 "00/6d/ce"
    print_osc4 13 "82/5d/c0"
    print_osc4 14 "00/97/8a"
    print_osc4 15 "3a/4d/53"

    print_osc_rgb 10 "53/67/6d"
    print_osc_rgb 11 "fb/f3/db"
    print_osc_rgb 12 "53/67/6d"
    print_osc_rgb 17 "3a/4d/53"
    print_osc_rgb 19 "ec/e3/cc"
}

do_linux() {
    print_linux 0 "#fbf3db"
    print_linux 1 "#cc1729"
    print_linux 2 "#428b00"
    print_linux 3 "#a78300"
    print_linux 4 "#006dce"
    print_linux 5 "#825dc0"
    print_linux 6 "#00978a"
    print_linux 7 "#53676d"
    print_linux 8 "#909995"
    print_linux 9 "#cc1729"
    print_linux 10 "#428b00"
    print_linux 11 "#a78300"
    print_linux 12 "#006dce"
    print_linux 13 "#825dc0"
    print_linux 14 "#00978a"
    print_linux 15 "#3a4d53"
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
