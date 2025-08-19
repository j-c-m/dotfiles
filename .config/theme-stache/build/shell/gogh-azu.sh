#!/usr/bin/env bash

# Source:   gogh
# Theme:    Azu
# Author:   
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ac/6d/74"
    print_osc4 2 "74/ac/6d"
    print_osc4 3 "ac/a4/6d"
    print_osc4 4 "6d/74/ac"
    print_osc4 5 "a4/6d/ac"
    print_osc4 6 "6d/ac/a4"
    print_osc4 7 "e6/e6/e6"
    print_osc4 8 "26/26/26"
    print_osc4 9 "d6/b8/bc"
    print_osc4 10 "bc/d6/b8"
    print_osc4 11 "d6/d3/b8"
    print_osc4 12 "b8/bc/d6"
    print_osc4 13 "d3/b8/d6"
    print_osc4 14 "b8/d6/d3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d9/e6/f2"
    print_osc_rgb 11 "09/11/1a"
    print_osc_rgb 12 "d9/e6/f2"
    print_osc_rgb 17 "d9/e6/f2"
    print_osc_rgb 19 "09/11/1a"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ac6d74"
    print_linux 2 "#74ac6d"
    print_linux 3 "#aca46d"
    print_linux 4 "#6d74ac"
    print_linux 5 "#a46dac"
    print_linux 6 "#6daca4"
    print_linux 7 "#d9e6f2"
    print_linux 8 "#262626"
    print_linux 9 "#d6b8bc"
    print_linux 10 "#bcd6b8"
    print_linux 11 "#d6d3b8"
    print_linux 12 "#b8bcd6"
    print_linux 13 "#d3b8d6"
    print_linux 14 "#b8d6d3"
    print_linux 15 "#ffffff"
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
