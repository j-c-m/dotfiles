#!/usr/bin/env bash

# Source:   base16
# Theme:    Primer Dark
# Author:   Jimmy Lin
# Variant:  dark

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
    print_osc4 0 "01/04/09"
    print_osc4 1 "ff/7b/72"
    print_osc4 2 "3f/b9/50"
    print_osc4 3 "d2/99/22"
    print_osc4 4 "58/a6/ff"
    print_osc4 5 "f7/78/ba"
    print_osc4 6 "a5/d6/ff"
    print_osc4 7 "b1/ba/c4"
    print_osc4 8 "48/4f/58"
    print_osc4 9 "ff/7b/72"
    print_osc4 10 "3f/b9/50"
    print_osc4 11 "d2/99/22"
    print_osc4 12 "58/a6/ff"
    print_osc4 13 "f7/78/ba"
    print_osc4 14 "a5/d6/ff"
    print_osc4 15 "f0/f6/fc"

    print_osc_rgb 10 "b1/ba/c4"
    print_osc_rgb 11 "01/04/09"
    print_osc_rgb 12 "b1/ba/c4"
    print_osc_rgb 17 "c9/d1/d9"
    print_osc_rgb 19 "21/26/2d"
}

do_linux() {
    print_linux 0 "#010409"
    print_linux 1 "#ff7b72"
    print_linux 2 "#3fb950"
    print_linux 3 "#d29922"
    print_linux 4 "#58a6ff"
    print_linux 5 "#f778ba"
    print_linux 6 "#a5d6ff"
    print_linux 7 "#b1bac4"
    print_linux 8 "#484f58"
    print_linux 9 "#ff7b72"
    print_linux 10 "#3fb950"
    print_linux 11 "#d29922"
    print_linux 12 "#58a6ff"
    print_linux 13 "#f778ba"
    print_linux 14 "#a5d6ff"
    print_linux 15 "#f0f6fc"
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
