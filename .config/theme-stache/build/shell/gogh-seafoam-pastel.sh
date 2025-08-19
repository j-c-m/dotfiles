#!/usr/bin/env bash

# Source:   gogh
# Theme:    Seafoam Pastel
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
    print_osc4 0 "75/75/75"
    print_osc4 1 "82/5d/4d"
    print_osc4 2 "72/8c/62"
    print_osc4 3 "ad/a1/6d"
    print_osc4 4 "4d/7b/82"
    print_osc4 5 "8a/72/67"
    print_osc4 6 "72/94/94"
    print_osc4 7 "e0/e0/e0"
    print_osc4 8 "8a/8a/8a"
    print_osc4 9 "cf/93/7a"
    print_osc4 10 "98/d9/aa"
    print_osc4 11 "fa/e7/9d"
    print_osc4 12 "7a/c3/cf"
    print_osc4 13 "d6/b2/a1"
    print_osc4 14 "ad/e0/e0"
    print_osc4 15 "e0/e0/e0"

    print_osc_rgb 10 "d4/e7/d4"
    print_osc_rgb 11 "24/34/35"
    print_osc_rgb 12 "d4/e7/d4"
    print_osc_rgb 17 "d4/e7/d4"
    print_osc_rgb 19 "24/34/35"
}

do_linux() {
    print_linux 0 "#757575"
    print_linux 1 "#825d4d"
    print_linux 2 "#728c62"
    print_linux 3 "#ada16d"
    print_linux 4 "#4d7b82"
    print_linux 5 "#8a7267"
    print_linux 6 "#729494"
    print_linux 7 "#d4e7d4"
    print_linux 8 "#8a8a8a"
    print_linux 9 "#cf937a"
    print_linux 10 "#98d9aa"
    print_linux 11 "#fae79d"
    print_linux 12 "#7ac3cf"
    print_linux 13 "#d6b2a1"
    print_linux 14 "#ade0e0"
    print_linux 15 "#e0e0e0"
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
