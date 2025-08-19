#!/usr/bin/env bash

# Source:   gogh
# Theme:    Flat
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
    print_osc4 0 "2c/3e/50"
    print_osc4 1 "c0/39/2b"
    print_osc4 2 "27/ae/60"
    print_osc4 3 "f3/9c/12"
    print_osc4 4 "29/80/b9"
    print_osc4 5 "8e/44/ad"
    print_osc4 6 "16/a0/85"
    print_osc4 7 "bd/c3/c7"
    print_osc4 8 "34/49/5e"
    print_osc4 9 "e7/4c/3c"
    print_osc4 10 "2e/cc/71"
    print_osc4 11 "f1/c4/0f"
    print_osc4 12 "34/98/db"
    print_osc4 13 "9b/59/b6"
    print_osc4 14 "2a/a1/98"
    print_osc4 15 "ec/f0/f1"

    print_osc_rgb 10 "1a/bc/9c"
    print_osc_rgb 11 "1f/2d/3a"
    print_osc_rgb 12 "1a/bc/9c"
    print_osc_rgb 17 "1a/bc/9c"
    print_osc_rgb 19 "1f/2d/3a"
}

do_linux() {
    print_linux 0 "#2c3e50"
    print_linux 1 "#c0392b"
    print_linux 2 "#27ae60"
    print_linux 3 "#f39c12"
    print_linux 4 "#2980b9"
    print_linux 5 "#8e44ad"
    print_linux 6 "#16a085"
    print_linux 7 "#1abc9c"
    print_linux 8 "#34495e"
    print_linux 9 "#e74c3c"
    print_linux 10 "#2ecc71"
    print_linux 11 "#f1c40f"
    print_linux 12 "#3498db"
    print_linux 13 "#9b59b6"
    print_linux 14 "#2aa198"
    print_linux 15 "#ecf0f1"
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
