#!/usr/bin/env bash

# Source:   gogh
# Theme:    Butrin
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
    print_osc4 0 "8c/7e/78"
    print_osc4 1 "e6/8a/8a"
    print_osc4 2 "99/cc/99"
    print_osc4 3 "fa/d7/a0"
    print_osc4 4 "66/99/cc"
    print_osc4 5 "c8/a2/c8"
    print_osc4 6 "6f/c3/b2"
    print_osc4 7 "e2/ce/be"
    print_osc4 8 "bf/ac/a4"
    print_osc4 9 "f2/b1/b1"
    print_osc4 10 "b2/d8/b2"
    print_osc4 11 "f7/dc/b4"
    print_osc4 12 "87/ce/fa"
    print_osc4 13 "d8/bf/d8"
    print_osc4 14 "64/db/db"
    print_osc4 15 "f2/f2/f2"

    print_osc_rgb 10 "f2/f2/f2"
    print_osc_rgb 11 "4b/3b/3c"
    print_osc_rgb 12 "e3/9d/93"
    print_osc_rgb 17 "f2/f2/f2"
    print_osc_rgb 19 "4b/3b/3c"
}

do_linux() {
    print_linux 0 "#8c7e78"
    print_linux 1 "#e68a8a"
    print_linux 2 "#99cc99"
    print_linux 3 "#fad7a0"
    print_linux 4 "#6699cc"
    print_linux 5 "#c8a2c8"
    print_linux 6 "#6fc3b2"
    print_linux 7 "#f2f2f2"
    print_linux 8 "#bfaca4"
    print_linux 9 "#f2b1b1"
    print_linux 10 "#b2d8b2"
    print_linux 11 "#f7dcb4"
    print_linux 12 "#87cefa"
    print_linux 13 "#d8bfd8"
    print_linux 14 "#64dbdb"
    print_linux 15 "#f2f2f2"
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
