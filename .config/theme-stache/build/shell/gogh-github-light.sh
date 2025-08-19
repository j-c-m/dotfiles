#!/usr/bin/env bash

# Source:   gogh
# Theme:    Github Light
# Author:   
# Variant:  light

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
    print_osc4 0 "24/29/2f"
    print_osc4 1 "cf/22/2e"
    print_osc4 2 "1a/7f/37"
    print_osc4 3 "9a/67/00"
    print_osc4 4 "09/69/da"
    print_osc4 5 "82/50/df"
    print_osc4 6 "1b/7c/83"
    print_osc4 7 "6e/77/81"
    print_osc4 8 "57/60/6a"
    print_osc4 9 "a4/0e/26"
    print_osc4 10 "2d/a4/4e"
    print_osc4 11 "bf/87/00"
    print_osc4 12 "21/8b/ff"
    print_osc4 13 "a4/75/f9"
    print_osc4 14 "31/92/aa"
    print_osc4 15 "8c/95/9f"

    print_osc_rgb 10 "1f/23/28"
    print_osc_rgb 11 "f6/f8/fa"
    print_osc_rgb 12 "1f/23/28"
    print_osc_rgb 17 "1f/23/28"
    print_osc_rgb 19 "f6/f8/fa"
}

do_linux() {
    print_linux 0 "#24292f"
    print_linux 1 "#cf222e"
    print_linux 2 "#1a7f37"
    print_linux 3 "#9a6700"
    print_linux 4 "#0969da"
    print_linux 5 "#8250df"
    print_linux 6 "#1b7c83"
    print_linux 7 "#1f2328"
    print_linux 8 "#57606a"
    print_linux 9 "#a40e26"
    print_linux 10 "#2da44e"
    print_linux 11 "#bf8700"
    print_linux 12 "#218bff"
    print_linux 13 "#a475f9"
    print_linux 14 "#3192aa"
    print_linux 15 "#8c959f"
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
