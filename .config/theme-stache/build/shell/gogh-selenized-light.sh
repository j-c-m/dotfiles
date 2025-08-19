#!/usr/bin/env bash

# Source:   gogh
# Theme:    Selenized Light
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "ec/e3/cc"
    print_osc4 1 "d2/21/2d"
    print_osc4 2 "48/91/00"
    print_osc4 3 "ad/89/00"
    print_osc4 4 "00/72/d4"
    print_osc4 5 "ca/48/98"
    print_osc4 6 "00/9c/8f"
    print_osc4 7 "90/99/95"
    print_osc4 8 "d5/cd/b6"
    print_osc4 9 "cc/17/29"
    print_osc4 10 "42/8b/00"
    print_osc4 11 "a7/83/00"
    print_osc4 12 "00/6d/ce"
    print_osc4 13 "c4/43/92"
    print_osc4 14 "00/97/8a"
    print_osc4 15 "3a/4d/53"

    print_osc_rgb 10 "53/67/6d"
    print_osc_rgb 11 "fb/f3/db"
    print_osc_rgb 12 "3a/4d/53"
    print_osc_rgb 17 "53/67/6d"
    print_osc_rgb 19 "fb/f3/db"
}

do_linux() {
    print_linux 0 "#ece3cc"
    print_linux 1 "#d2212d"
    print_linux 2 "#489100"
    print_linux 3 "#ad8900"
    print_linux 4 "#0072d4"
    print_linux 5 "#ca4898"
    print_linux 6 "#009c8f"
    print_linux 7 "#53676d"
    print_linux 8 "#d5cdb6"
    print_linux 9 "#cc1729"
    print_linux 10 "#428b00"
    print_linux 11 "#a78300"
    print_linux 12 "#006dce"
    print_linux 13 "#c44392"
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
