#!/usr/bin/env bash

# Source:   base24
# Theme:    Birds Of Paradise
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
    print_osc4 0 "2a/1e/1d"
    print_osc4 1 "be/2d/26"
    print_osc4 2 "6b/a0/8a"
    print_osc4 3 "b8/d3/ed"
    print_osc4 4 "5a/86/ac"
    print_osc4 5 "ab/80/a6"
    print_osc4 6 "74/a5/ac"
    print_osc4 7 "cd/be/9b"
    print_osc4 8 "ab/86/64"
    print_osc4 9 "e8/45/26"
    print_osc4 10 "94/d7/ba"
    print_osc4 11 "d0/d0/4f"
    print_osc4 12 "b8/d3/ed"
    print_osc4 13 "d0/9d/ca"
    print_osc4 14 "92/ce/d6"
    print_osc4 15 "ff/f9/d4"

    print_osc_rgb 10 "cd/be/9b"
    print_osc_rgb 11 "2a/1e/1d"
    print_osc_rgb 12 "cd/be/9b"
    print_osc_rgb 17 "df/da/b7"
    print_osc_rgb 19 "57/3d/25"
}

do_linux() {
    print_linux 0 "#2a1e1d"
    print_linux 1 "#be2d26"
    print_linux 2 "#6ba08a"
    print_linux 3 "#b8d3ed"
    print_linux 4 "#5a86ac"
    print_linux 5 "#ab80a6"
    print_linux 6 "#74a5ac"
    print_linux 7 "#cdbe9b"
    print_linux 8 "#ab8664"
    print_linux 9 "#e84526"
    print_linux 10 "#94d7ba"
    print_linux 11 "#d0d04f"
    print_linux 12 "#b8d3ed"
    print_linux 13 "#d09dca"
    print_linux 14 "#92ced6"
    print_linux 15 "#fff9d4"
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
