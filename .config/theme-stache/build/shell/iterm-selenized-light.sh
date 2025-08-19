#!/usr/bin/env bash

# Source:   iterm
# Theme:    selenized-light
# Author:   unknown
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
    print_osc4 0 "ec/e3/cc"
    print_osc4 1 "d1/20/2d"
    print_osc4 2 "48/90/00"
    print_osc4 3 "ac/89/00"
    print_osc4 4 "00/72/d4"
    print_osc4 5 "ca/48/98"
    print_osc4 6 "00/9c/8f"
    print_osc4 7 "8f/99/94"
    print_osc4 8 "d5/cc/b5"
    print_osc4 9 "cc/17/29"
    print_osc4 10 "41/8b/00"
    print_osc4 11 "a6/82/00"
    print_osc4 12 "00/6d/cd"
    print_osc4 13 "c3/42/91"
    print_osc4 14 "00/97/8a"
    print_osc4 15 "3a/4d/53"

    print_osc_rgb 10 "53/66/6d"
    print_osc_rgb 11 "fa/f2/da"
    print_osc_rgb 12 "53/66/6d"
    print_osc_rgb 17 "ec/e3/cc"
    print_osc_rgb 19 "00/97/8a"
}

do_linux() {
    print_linux 0 "#ece3cc"
    print_linux 1 "#d1202d"
    print_linux 2 "#489000"
    print_linux 3 "#ac8900"
    print_linux 4 "#0072d4"
    print_linux 5 "#ca4898"
    print_linux 6 "#009c8f"
    print_linux 7 "#53666d"
    print_linux 8 "#d5ccb5"
    print_linux 9 "#cc1729"
    print_linux 10 "#418b00"
    print_linux 11 "#a68200"
    print_linux 12 "#006dcd"
    print_linux 13 "#c34291"
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
