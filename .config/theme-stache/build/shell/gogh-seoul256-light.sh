#!/usr/bin/env bash

# Source:   gogh
# Theme:    Seoul256 Light
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
    print_osc4 0 "4e/4e/4e"
    print_osc4 1 "af/5f/5f"
    print_osc4 2 "5f/88/5f"
    print_osc4 3 "af/87/60"
    print_osc4 4 "5f/87/ae"
    print_osc4 5 "87/5f/87"
    print_osc4 6 "5f/87/87"
    print_osc4 7 "e4/e4/e4"
    print_osc4 8 "3a/3a/3a"
    print_osc4 9 "87/01/00"
    print_osc4 10 "00/5f/00"
    print_osc4 11 "d8/86/5f"
    print_osc4 12 "00/87/af"
    print_osc4 13 "87/02/5f"
    print_osc4 14 "00/87/87"
    print_osc4 15 "ee/ee/ee"

    print_osc_rgb 10 "4e/4e/4e"
    print_osc_rgb 11 "da/da/da"
    print_osc_rgb 12 "4e/4e/4e"
    print_osc_rgb 17 "4e/4e/4e"
    print_osc_rgb 19 "da/da/da"
}

do_linux() {
    print_linux 0 "#4e4e4e"
    print_linux 1 "#af5f5f"
    print_linux 2 "#5f885f"
    print_linux 3 "#af8760"
    print_linux 4 "#5f87ae"
    print_linux 5 "#875f87"
    print_linux 6 "#5f8787"
    print_linux 7 "#4e4e4e"
    print_linux 8 "#3a3a3a"
    print_linux 9 "#870100"
    print_linux 10 "#005f00"
    print_linux 11 "#d8865f"
    print_linux 12 "#0087af"
    print_linux 13 "#87025f"
    print_linux 14 "#008787"
    print_linux 15 "#eeeeee"
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
