#!/usr/bin/env bash

# Source:   base16
# Theme:    Spacemacs
# Author:   Nasser Alshammari (https://github.com/nashamri/spacemacs-theme)
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
    print_osc4 0 "1f/20/22"
    print_osc4 1 "f2/24/1f"
    print_osc4 2 "67/b1/1d"
    print_osc4 3 "b1/95/1d"
    print_osc4 4 "4f/97/d7"
    print_osc4 5 "a3/1d/b1"
    print_osc4 6 "2d/95/74"
    print_osc4 7 "a3/a3/a3"
    print_osc4 8 "58/58/58"
    print_osc4 9 "f2/24/1f"
    print_osc4 10 "67/b1/1d"
    print_osc4 11 "b1/95/1d"
    print_osc4 12 "4f/97/d7"
    print_osc4 13 "a3/1d/b1"
    print_osc4 14 "2d/95/74"
    print_osc4 15 "f8/f8/f8"

    print_osc_rgb 10 "a3/a3/a3"
    print_osc_rgb 11 "1f/20/22"
    print_osc_rgb 12 "a3/a3/a3"
    print_osc_rgb 17 "e8/e8/e8"
    print_osc_rgb 19 "28/28/28"
}

do_linux() {
    print_linux 0 "#1f2022"
    print_linux 1 "#f2241f"
    print_linux 2 "#67b11d"
    print_linux 3 "#b1951d"
    print_linux 4 "#4f97d7"
    print_linux 5 "#a31db1"
    print_linux 6 "#2d9574"
    print_linux 7 "#a3a3a3"
    print_linux 8 "#585858"
    print_linux 9 "#f2241f"
    print_linux 10 "#67b11d"
    print_linux 11 "#b1951d"
    print_linux 12 "#4f97d7"
    print_linux 13 "#a31db1"
    print_linux 14 "#2d9574"
    print_linux 15 "#f8f8f8"
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
