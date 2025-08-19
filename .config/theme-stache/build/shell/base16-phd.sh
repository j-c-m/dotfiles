#!/usr/bin/env bash

# Source:   base16
# Theme:    PhD
# Author:   Hennig Hasemann (http://leetless.de/vim.html)
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
    print_osc4 0 "06/12/29"
    print_osc4 1 "d0/73/46"
    print_osc4 2 "99/bf/52"
    print_osc4 3 "fb/d4/61"
    print_osc4 4 "52/99/bf"
    print_osc4 5 "99/89/cc"
    print_osc4 6 "72/b9/bf"
    print_osc4 7 "b8/bb/c2"
    print_osc4 8 "71/78/85"
    print_osc4 9 "d0/73/46"
    print_osc4 10 "99/bf/52"
    print_osc4 11 "fb/d4/61"
    print_osc4 12 "52/99/bf"
    print_osc4 13 "99/89/cc"
    print_osc4 14 "72/b9/bf"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "b8/bb/c2"
    print_osc_rgb 11 "06/12/29"
    print_osc_rgb 12 "b8/bb/c2"
    print_osc_rgb 17 "db/dd/e0"
    print_osc_rgb 19 "2a/34/48"
}

do_linux() {
    print_linux 0 "#061229"
    print_linux 1 "#d07346"
    print_linux 2 "#99bf52"
    print_linux 3 "#fbd461"
    print_linux 4 "#5299bf"
    print_linux 5 "#9989cc"
    print_linux 6 "#72b9bf"
    print_linux 7 "#b8bbc2"
    print_linux 8 "#717885"
    print_linux 9 "#d07346"
    print_linux 10 "#99bf52"
    print_linux 11 "#fbd461"
    print_linux 12 "#5299bf"
    print_linux 13 "#9989cc"
    print_linux 14 "#72b9bf"
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
