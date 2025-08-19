#!/usr/bin/env bash

# Source:   iterm
# Theme:    GitHub-Light-High-Contrast
# Author:   unknown
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
    print_osc4 0 "0e/11/16"
    print_osc4 1 "a0/11/1f"
    print_osc4 2 "02/4c/1a"
    print_osc4 3 "3f/22/00"
    print_osc4 4 "03/49/b4"
    print_osc4 5 "62/2c/bc"
    print_osc4 6 "1b/7c/83"
    print_osc4 7 "66/70/7b"
    print_osc4 8 "4b/53/5d"
    print_osc4 9 "86/06/1d"
    print_osc4 10 "05/5d/20"
    print_osc4 11 "4e/2c/00"
    print_osc4 12 "11/68/e3"
    print_osc4 13 "84/4a/e7"
    print_osc4 14 "31/92/aa"
    print_osc4 15 "88/92/9d"

    print_osc_rgb 10 "0e/11/16"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "03/49/b4"
    print_osc_rgb 17 "0e/11/16"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#0e1116"
    print_linux 1 "#a0111f"
    print_linux 2 "#024c1a"
    print_linux 3 "#3f2200"
    print_linux 4 "#0349b4"
    print_linux 5 "#622cbc"
    print_linux 6 "#1b7c83"
    print_linux 7 "#0e1116"
    print_linux 8 "#4b535d"
    print_linux 9 "#86061d"
    print_linux 10 "#055d20"
    print_linux 11 "#4e2c00"
    print_linux 12 "#1168e3"
    print_linux 13 "#844ae7"
    print_linux 14 "#3192aa"
    print_linux 15 "#88929d"
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
