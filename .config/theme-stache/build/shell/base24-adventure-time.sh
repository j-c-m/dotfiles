#!/usr/bin/env bash

# Source:   base24
# Theme:    Adventure Time
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "1e/1c/44"
    print_osc4 1 "bc/00/13"
    print_osc4 2 "49/b1/17"
    print_osc4 3 "18/96/c6"
    print_osc4 4 "0f/49/c6"
    print_osc4 5 "66/59/92"
    print_osc4 6 "6f/a4/97"
    print_osc4 7 "cd/c3/bf"
    print_osc4 8 "78/93/bf"
    print_osc4 9 "fc/5e/59"
    print_osc4 10 "9d/ff/6e"
    print_osc4 11 "ef/c1/1a"
    print_osc4 12 "18/96/c6"
    print_osc4 13 "9a/59/52"
    print_osc4 14 "c8/f9/f3"
    print_osc4 15 "f5/f4/fb"

    print_osc_rgb 10 "cd/c3/bf"
    print_osc_rgb 11 "1e/1c/44"
    print_osc_rgb 12 "cd/c3/bf"
    print_osc_rgb 17 "f8/db/c0"
    print_osc_rgb 19 "05/04/04"
}

do_linux() {
    print_linux 0 "#1e1c44"
    print_linux 1 "#bc0013"
    print_linux 2 "#49b117"
    print_linux 3 "#1896c6"
    print_linux 4 "#0f49c6"
    print_linux 5 "#665992"
    print_linux 6 "#6fa497"
    print_linux 7 "#cdc3bf"
    print_linux 8 "#7893bf"
    print_linux 9 "#fc5e59"
    print_linux 10 "#9dff6e"
    print_linux 11 "#efc11a"
    print_linux 12 "#1896c6"
    print_linux 13 "#9a5952"
    print_linux 14 "#c8f9f3"
    print_linux 15 "#f5f4fb"
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
