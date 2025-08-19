#!/usr/bin/env bash

# Source:   base24
# Theme:    Catppuccin Macchiato
# Author:   https://github.com/catppuccin/catppuccin
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
    print_osc4 0 "24/27/3a"
    print_osc4 1 "ed/87/96"
    print_osc4 2 "a6/da/95"
    print_osc4 3 "ee/d4/9f"
    print_osc4 4 "8a/ad/f4"
    print_osc4 5 "c6/a0/f6"
    print_osc4 6 "8b/d5/ca"
    print_osc4 7 "ca/d3/f5"
    print_osc4 8 "49/4d/64"
    print_osc4 9 "ee/99/a0"
    print_osc4 10 "a6/da/95"
    print_osc4 11 "f4/db/d6"
    print_osc4 12 "7d/c4/e4"
    print_osc4 13 "f5/bd/e6"
    print_osc4 14 "91/d7/e3"
    print_osc4 15 "b7/bd/f8"

    print_osc_rgb 10 "ca/d3/f5"
    print_osc_rgb 11 "24/27/3a"
    print_osc_rgb 12 "ca/d3/f5"
    print_osc_rgb 17 "f4/db/d6"
    print_osc_rgb 19 "1e/20/30"
}

do_linux() {
    print_linux 0 "#24273a"
    print_linux 1 "#ed8796"
    print_linux 2 "#a6da95"
    print_linux 3 "#eed49f"
    print_linux 4 "#8aadf4"
    print_linux 5 "#c6a0f6"
    print_linux 6 "#8bd5ca"
    print_linux 7 "#cad3f5"
    print_linux 8 "#494d64"
    print_linux 9 "#ee99a0"
    print_linux 10 "#a6da95"
    print_linux 11 "#f4dbd6"
    print_linux 12 "#7dc4e4"
    print_linux 13 "#f5bde6"
    print_linux 14 "#91d7e3"
    print_linux 15 "#b7bdf8"
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
