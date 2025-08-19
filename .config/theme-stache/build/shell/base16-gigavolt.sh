#!/usr/bin/env bash

# Source:   base16
# Theme:    Gigavolt
# Author:   Aidan Swope (http://github.com/Whillikers)
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
    print_osc4 0 "20/21/26"
    print_osc4 1 "ff/66/1a"
    print_osc4 2 "f2/e6/a9"
    print_osc4 3 "ff/dc/2d"
    print_osc4 4 "40/bf/ff"
    print_osc4 5 "ae/94/f9"
    print_osc4 6 "fb/6a/cb"
    print_osc4 7 "e9/e7/e1"
    print_osc4 8 "a1/d2/e6"
    print_osc4 9 "ff/66/1a"
    print_osc4 10 "f2/e6/a9"
    print_osc4 11 "ff/dc/2d"
    print_osc4 12 "40/bf/ff"
    print_osc4 13 "ae/94/f9"
    print_osc4 14 "fb/6a/cb"
    print_osc4 15 "f2/fb/ff"

    print_osc_rgb 10 "e9/e7/e1"
    print_osc_rgb 11 "20/21/26"
    print_osc_rgb 12 "e9/e7/e1"
    print_osc_rgb 17 "ef/f0/f9"
    print_osc_rgb 19 "2d/30/3d"
}

do_linux() {
    print_linux 0 "#202126"
    print_linux 1 "#ff661a"
    print_linux 2 "#f2e6a9"
    print_linux 3 "#ffdc2d"
    print_linux 4 "#40bfff"
    print_linux 5 "#ae94f9"
    print_linux 6 "#fb6acb"
    print_linux 7 "#e9e7e1"
    print_linux 8 "#a1d2e6"
    print_linux 9 "#ff661a"
    print_linux 10 "#f2e6a9"
    print_linux 11 "#ffdc2d"
    print_linux 12 "#40bfff"
    print_linux 13 "#ae94f9"
    print_linux 14 "#fb6acb"
    print_linux 15 "#f2fbff"
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
