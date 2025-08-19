#!/usr/bin/env bash

# Source:   iterm
# Theme:    Ghostty Default StyleDark
# Author:   unknown
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
    print_osc4 0 "1c/1f/21"
    print_osc4 1 "cc/65/66"
    print_osc4 2 "b5/bd/68"
    print_osc4 3 "ef/c6/74"
    print_osc4 4 "81/a1/bd"
    print_osc4 5 "b1/93/ba"
    print_osc4 6 "89/be/b7"
    print_osc4 7 "c4/c8/c5"
    print_osc4 8 "66/65/65"
    print_osc4 9 "d4/4d/52"
    print_osc4 10 "b8/c9/4a"
    print_osc4 11 "e6/c4/47"
    print_osc4 12 "79/a6/da"
    print_osc4 13 "c2/97/d8"
    print_osc4 14 "70/bf/b0"
    print_osc4 15 "ea/e9/e9"

    print_osc_rgb 10 "fe/fe/fe"
    print_osc_rgb 11 "28/2c/33"
    print_osc_rgb 12 "fe/fe/fe"
    print_osc_rgb 17 "fe/fe/fe"
    print_osc_rgb 19 "28/2c/33"
}

do_linux() {
    print_linux 0 "#1c1f21"
    print_linux 1 "#cc6566"
    print_linux 2 "#b5bd68"
    print_linux 3 "#efc674"
    print_linux 4 "#81a1bd"
    print_linux 5 "#b193ba"
    print_linux 6 "#89beb7"
    print_linux 7 "#fefefe"
    print_linux 8 "#666565"
    print_linux 9 "#d44d52"
    print_linux 10 "#b8c94a"
    print_linux 11 "#e6c447"
    print_linux 12 "#79a6da"
    print_linux 13 "#c297d8"
    print_linux 14 "#70bfb0"
    print_linux 15 "#eae9e9"
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
