#!/usr/bin/env bash

# Source:   base16
# Theme:    Terracotta Dark
# Author:   Alexander Rossell Hayes (https://github.com/rossellhayes)
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
    print_osc4 0 "24/1d/1a"
    print_osc4 1 "f6/99/8f"
    print_osc4 2 "b6/c6/8a"
    print_osc4 3 "ff/c3/7a"
    print_osc4 4 "b0/a4/c3"
    print_osc4 5 "d8/a2/b0"
    print_osc4 6 "c0/bc/db"
    print_osc4 7 "b8/a5/9d"
    print_osc4 8 "59/47/40"
    print_osc4 9 "f6/99/8f"
    print_osc4 10 "b6/c6/8a"
    print_osc4 11 "ff/c3/7a"
    print_osc4 12 "b0/a4/c3"
    print_osc4 13 "d8/a2/b0"
    print_osc4 14 "c0/bc/db"
    print_osc4 15 "dc/d2/ce"

    print_osc_rgb 10 "b8/a5/9d"
    print_osc_rgb 11 "24/1d/1a"
    print_osc_rgb 12 "b8/a5/9d"
    print_osc_rgb 17 "ca/bb/b5"
    print_osc_rgb 19 "36/2b/27"
}

do_linux() {
    print_linux 0 "#241d1a"
    print_linux 1 "#f6998f"
    print_linux 2 "#b6c68a"
    print_linux 3 "#ffc37a"
    print_linux 4 "#b0a4c3"
    print_linux 5 "#d8a2b0"
    print_linux 6 "#c0bcdb"
    print_linux 7 "#b8a59d"
    print_linux 8 "#594740"
    print_linux 9 "#f6998f"
    print_linux 10 "#b6c68a"
    print_linux 11 "#ffc37a"
    print_linux 12 "#b0a4c3"
    print_linux 13 "#d8a2b0"
    print_linux 14 "#c0bcdb"
    print_linux 15 "#dcd2ce"
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
