#!/usr/bin/env bash

# Source:   gogh
# Theme:    Frontend Delight
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "24/25/26"
    print_osc4 1 "f8/51/1b"
    print_osc4 2 "56/57/47"
    print_osc4 3 "fa/77/1d"
    print_osc4 4 "2c/70/b7"
    print_osc4 5 "f0/2e/4f"
    print_osc4 6 "3c/a1/a6"
    print_osc4 7 "ad/ad/ad"
    print_osc4 8 "5f/ac/6d"
    print_osc4 9 "f7/43/19"
    print_osc4 10 "74/ec/4c"
    print_osc4 11 "fd/c3/25"
    print_osc4 12 "33/93/ca"
    print_osc4 13 "e7/5e/4f"
    print_osc4 14 "4f/bc/e6"
    print_osc4 15 "8c/73/5b"

    print_osc_rgb 10 "ad/ad/ad"
    print_osc_rgb 11 "1b/1c/1d"
    print_osc_rgb 12 "ad/ad/ad"
    print_osc_rgb 17 "ad/ad/ad"
    print_osc_rgb 19 "1b/1c/1d"
}

do_linux() {
    print_linux 0 "#242526"
    print_linux 1 "#f8511b"
    print_linux 2 "#565747"
    print_linux 3 "#fa771d"
    print_linux 4 "#2c70b7"
    print_linux 5 "#f02e4f"
    print_linux 6 "#3ca1a6"
    print_linux 7 "#adadad"
    print_linux 8 "#5fac6d"
    print_linux 9 "#f74319"
    print_linux 10 "#74ec4c"
    print_linux 11 "#fdc325"
    print_linux 12 "#3393ca"
    print_linux 13 "#e75e4f"
    print_linux 14 "#4fbce6"
    print_linux 15 "#8c735b"
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
