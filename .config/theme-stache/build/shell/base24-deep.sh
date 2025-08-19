#!/usr/bin/env bash

# Source:   base24
# Theme:    deep
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "08/08/08"
    print_osc4 1 "d6/00/05"
    print_osc4 2 "1c/d8/15"
    print_osc4 3 "9f/a8/fe"
    print_osc4 4 "56/65/fe"
    print_osc4 5 "af/51/d9"
    print_osc4 6 "4f/d2/d9"
    print_osc4 7 "bc/bc/bc"
    print_osc4 8 "76/76/76"
    print_osc4 9 "fb/00/06"
    print_osc4 10 "21/fe/17"
    print_osc4 11 "fe/dc/2b"
    print_osc4 12 "9f/a8/fe"
    print_osc4 13 "e0/99/fe"
    print_osc4 14 "8c/f9/fe"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "bc/bc/bc"
    print_osc_rgb 11 "08/08/08"
    print_osc_rgb 12 "bc/bc/bc"
    print_osc_rgb 17 "df/df/df"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#080808"
    print_linux 1 "#d60005"
    print_linux 2 "#1cd815"
    print_linux 3 "#9fa8fe"
    print_linux 4 "#5665fe"
    print_linux 5 "#af51d9"
    print_linux 6 "#4fd2d9"
    print_linux 7 "#bcbcbc"
    print_linux 8 "#767676"
    print_linux 9 "#fb0006"
    print_linux 10 "#21fe17"
    print_linux 11 "#fedc2b"
    print_linux 12 "#9fa8fe"
    print_linux 13 "#e099fe"
    print_linux 14 "#8cf9fe"
    print_linux 15 "#fffefe"
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
