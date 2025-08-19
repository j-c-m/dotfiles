#!/usr/bin/env bash

# Source:   base16
# Theme:    Gruvbox Material Light, Soft
# Author:   Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
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
    print_osc4 0 "f2/e5/bc"
    print_osc4 1 "c1/4a/4a"
    print_osc4 2 "6c/78/2e"
    print_osc4 3 "b4/71/09"
    print_osc4 4 "45/70/7a"
    print_osc4 5 "94/5e/80"
    print_osc4 6 "4c/7a/5d"
    print_osc4 7 "65/47/35"
    print_osc4 8 "a8/99/84"
    print_osc4 9 "c1/4a/4a"
    print_osc4 10 "6c/78/2e"
    print_osc4 11 "b4/71/09"
    print_osc4 12 "45/70/7a"
    print_osc4 13 "94/5e/80"
    print_osc4 14 "4c/7a/5d"
    print_osc4 15 "28/28/28"

    print_osc_rgb 10 "65/47/35"
    print_osc_rgb 11 "f2/e5/bc"
    print_osc_rgb 12 "65/47/35"
    print_osc_rgb 17 "3c/38/36"
    print_osc_rgb 19 "eb/db/b2"
}

do_linux() {
    print_linux 0 "#f2e5bc"
    print_linux 1 "#c14a4a"
    print_linux 2 "#6c782e"
    print_linux 3 "#b47109"
    print_linux 4 "#45707a"
    print_linux 5 "#945e80"
    print_linux 6 "#4c7a5d"
    print_linux 7 "#654735"
    print_linux 8 "#a89984"
    print_linux 9 "#c14a4a"
    print_linux 10 "#6c782e"
    print_linux 11 "#b47109"
    print_linux 12 "#45707a"
    print_linux 13 "#945e80"
    print_linux 14 "#4c7a5d"
    print_linux 15 "#282828"
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
