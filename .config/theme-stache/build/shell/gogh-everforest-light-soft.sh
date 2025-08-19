#!/usr/bin/env bash

# Source:   gogh
# Theme:    Everforest Light Soft
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
    print_osc4 0 "5c/6a/72"
    print_osc4 1 "f8/55/52"
    print_osc4 2 "8d/a1/01"
    print_osc4 3 "df/a0/00"
    print_osc4 4 "3a/94/c5"
    print_osc4 5 "df/69/ba"
    print_osc4 6 "35/a7/7c"
    print_osc4 7 "df/dd/c8"
    print_osc4 8 "3a/46/4c"
    print_osc4 9 "e6/7e/80"
    print_osc4 10 "a7/c0/80"
    print_osc4 11 "db/bc/7f"
    print_osc4 12 "7f/bb/b3"
    print_osc4 13 "d6/99/b6"
    print_osc4 14 "83/c0/92"
    print_osc4 15 "d3/c6/aa"

    print_osc_rgb 10 "5c/6a/72"
    print_osc_rgb 11 "f3/ea/d3"
    print_osc_rgb 12 "5c/6a/72"
    print_osc_rgb 17 "5c/6a/72"
    print_osc_rgb 19 "f3/ea/d3"
}

do_linux() {
    print_linux 0 "#5c6a72"
    print_linux 1 "#f85552"
    print_linux 2 "#8da101"
    print_linux 3 "#dfa000"
    print_linux 4 "#3a94c5"
    print_linux 5 "#df69ba"
    print_linux 6 "#35a77c"
    print_linux 7 "#5c6a72"
    print_linux 8 "#3a464c"
    print_linux 9 "#e67e80"
    print_linux 10 "#a7c080"
    print_linux 11 "#dbbc7f"
    print_linux 12 "#7fbbb3"
    print_linux 13 "#d699b6"
    print_linux 14 "#83c092"
    print_linux 15 "#d3c6aa"
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
