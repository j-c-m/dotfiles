#!/usr/bin/env bash

# Source:   base16
# Theme:    Woodland
# Author:   Jay Cornwall (https://jcornwall.com)
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "23/1e/18"
    print_osc4 1 "d3/5c/5c"
    print_osc4 2 "b7/ba/53"
    print_osc4 3 "e0/ac/16"
    print_osc4 4 "88/a4/d3"
    print_osc4 5 "bb/90/e2"
    print_osc4 6 "6e/b9/58"
    print_osc4 7 "ca/bc/b1"
    print_osc4 8 "9d/8b/70"
    print_osc4 9 "d3/5c/5c"
    print_osc4 10 "b7/ba/53"
    print_osc4 11 "e0/ac/16"
    print_osc4 12 "88/a4/d3"
    print_osc4 13 "bb/90/e2"
    print_osc4 14 "6e/b9/58"
    print_osc4 15 "e4/d4/c8"

    print_osc_rgb 10 "ca/bc/b1"
    print_osc_rgb 11 "23/1e/18"
    print_osc_rgb 12 "ca/bc/b1"
    print_osc_rgb 17 "d7/c8/bc"
    print_osc_rgb 19 "30/2b/25"
}

do_linux() {
    print_linux 0 "#231e18"
    print_linux 1 "#d35c5c"
    print_linux 2 "#b7ba53"
    print_linux 3 "#e0ac16"
    print_linux 4 "#88a4d3"
    print_linux 5 "#bb90e2"
    print_linux 6 "#6eb958"
    print_linux 7 "#cabcb1"
    print_linux 8 "#9d8b70"
    print_linux 9 "#d35c5c"
    print_linux 10 "#b7ba53"
    print_linux 11 "#e0ac16"
    print_linux 12 "#88a4d3"
    print_linux 13 "#bb90e2"
    print_linux 14 "#6eb958"
    print_linux 15 "#e4d4c8"
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
