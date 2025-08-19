#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ic Green Ppl
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "1f/1f/1f"
    print_osc4 1 "fb/00/2a"
    print_osc4 2 "33/9c/24"
    print_osc4 3 "65/9b/25"
    print_osc4 4 "14/9b/45"
    print_osc4 5 "53/b8/2c"
    print_osc4 6 "2c/b8/68"
    print_osc4 7 "e0/ff/ef"
    print_osc4 8 "03/27/10"
    print_osc4 9 "a7/ff/3f"
    print_osc4 10 "9f/ff/6d"
    print_osc4 11 "d2/ff/6d"
    print_osc4 12 "72/ff/b5"
    print_osc4 13 "50/ff/3e"
    print_osc4 14 "22/ff/71"
    print_osc4 15 "da/ef/d0"

    print_osc_rgb 10 "d9/ef/d3"
    print_osc_rgb 11 "3a/3d/3f"
    print_osc_rgb 12 "d9/ef/d3"
    print_osc_rgb 17 "d9/ef/d3"
    print_osc_rgb 19 "3a/3d/3f"
}

do_linux() {
    print_linux 0 "#1f1f1f"
    print_linux 1 "#fb002a"
    print_linux 2 "#339c24"
    print_linux 3 "#659b25"
    print_linux 4 "#149b45"
    print_linux 5 "#53b82c"
    print_linux 6 "#2cb868"
    print_linux 7 "#d9efd3"
    print_linux 8 "#032710"
    print_linux 9 "#a7ff3f"
    print_linux 10 "#9fff6d"
    print_linux 11 "#d2ff6d"
    print_linux 12 "#72ffb5"
    print_linux 13 "#50ff3e"
    print_linux 14 "#22ff71"
    print_linux 15 "#daefd0"
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
