#!/usr/bin/env bash

# Source:   base24
# Theme:    Flatland
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
    print_osc4 0 "1c/1e/20"
    print_osc4 1 "f1/82/38"
    print_osc4 2 "9e/d2/64"
    print_osc4 3 "61/b8/d0"
    print_osc4 4 "4f/96/be"
    print_osc4 5 "69/5a/bb"
    print_osc4 6 "d5/38/64"
    print_osc4 7 "c5/c6/c4"
    print_osc4 8 "54/55/52"
    print_osc4 9 "d1/2a/24"
    print_osc4 10 "a7/d3/2c"
    print_osc4 11 "ff/89/48"
    print_osc4 12 "61/b8/d0"
    print_osc4 13 "69/5a/bb"
    print_osc4 14 "d5/38/64"
    print_osc4 15 "fe/ff/fe"

    print_osc_rgb 10 "c5/c6/c4"
    print_osc_rgb 11 "1c/1e/20"
    print_osc_rgb 12 "c5/c6/c4"
    print_osc_rgb 17 "fe/ff/fe"
    print_osc_rgb 19 "1c/1d/19"
}

do_linux() {
    print_linux 0 "#1c1e20"
    print_linux 1 "#f18238"
    print_linux 2 "#9ed264"
    print_linux 3 "#61b8d0"
    print_linux 4 "#4f96be"
    print_linux 5 "#695abb"
    print_linux 6 "#d53864"
    print_linux 7 "#c5c6c4"
    print_linux 8 "#545552"
    print_linux 9 "#d12a24"
    print_linux 10 "#a7d32c"
    print_linux 11 "#ff8948"
    print_linux 12 "#61b8d0"
    print_linux 13 "#695abb"
    print_linux 14 "#d53864"
    print_linux 15 "#fefffe"
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
