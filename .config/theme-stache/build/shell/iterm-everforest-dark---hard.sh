#!/usr/bin/env bash

# Source:   iterm
# Theme:    Everforest Dark - Hard
# Author:   unknown
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
    print_osc4 0 "7a/84/78"
    print_osc4 1 "e6/7e/80"
    print_osc4 2 "a7/c0/80"
    print_osc4 3 "db/bc/7f"
    print_osc4 4 "7f/bb/b3"
    print_osc4 5 "d6/99/b6"
    print_osc4 6 "83/c0/92"
    print_osc4 7 "f2/ef/df"
    print_osc4 8 "a6/b0/a0"
    print_osc4 9 "f8/55/52"
    print_osc4 10 "8d/a1/01"
    print_osc4 11 "df/a0/00"
    print_osc4 12 "3a/94/c5"
    print_osc4 13 "df/69/ba"
    print_osc4 14 "35/a7/7c"
    print_osc4 15 "ff/fb/ef"

    print_osc_rgb 10 "d3/c6/aa"
    print_osc_rgb 11 "1e/23/26"
    print_osc_rgb 12 "e6/98/75"
    print_osc_rgb 17 "4c/37/43"
    print_osc_rgb 19 "d3/c6/aa"
}

do_linux() {
    print_linux 0 "#7a8478"
    print_linux 1 "#e67e80"
    print_linux 2 "#a7c080"
    print_linux 3 "#dbbc7f"
    print_linux 4 "#7fbbb3"
    print_linux 5 "#d699b6"
    print_linux 6 "#83c092"
    print_linux 7 "#d3c6aa"
    print_linux 8 "#a6b0a0"
    print_linux 9 "#f85552"
    print_linux 10 "#8da101"
    print_linux 11 "#dfa000"
    print_linux 12 "#3a94c5"
    print_linux 13 "#df69ba"
    print_linux 14 "#35a77c"
    print_linux 15 "#fffbef"
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
