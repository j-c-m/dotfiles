#!/usr/bin/env bash

# Source:   base16
# Theme:    Measured Dark
# Author:   Measured (https://measured.co)
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
    print_osc4 0 "00/21/1f"
    print_osc4 1 "ce/7e/8e"
    print_osc4 2 "56/c1/6f"
    print_osc4 3 "bf/ac/4e"
    print_osc4 4 "88/b0/da"
    print_osc4 5 "b3/9b/e0"
    print_osc4 6 "62/c0/be"
    print_osc4 7 "dc/dc/dc"
    print_osc4 8 "ab/ab/ab"
    print_osc4 9 "ce/7e/8e"
    print_osc4 10 "56/c1/6f"
    print_osc4 11 "bf/ac/4e"
    print_osc4 12 "88/b0/da"
    print_osc4 13 "b3/9b/e0"
    print_osc4 14 "62/c0/be"
    print_osc4 15 "f5/f5/f5"

    print_osc_rgb 10 "dc/dc/dc"
    print_osc_rgb 11 "00/21/1f"
    print_osc_rgb 12 "dc/dc/dc"
    print_osc_rgb 17 "ef/ef/ef"
    print_osc_rgb 19 "00/3a/38"
}

do_linux() {
    print_linux 0 "#00211f"
    print_linux 1 "#ce7e8e"
    print_linux 2 "#56c16f"
    print_linux 3 "#bfac4e"
    print_linux 4 "#88b0da"
    print_linux 5 "#b39be0"
    print_linux 6 "#62c0be"
    print_linux 7 "#dcdcdc"
    print_linux 8 "#ababab"
    print_linux 9 "#ce7e8e"
    print_linux 10 "#56c16f"
    print_linux 11 "#bfac4e"
    print_linux 12 "#88b0da"
    print_linux 13 "#b39be0"
    print_linux 14 "#62c0be"
    print_linux 15 "#f5f5f5"
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
