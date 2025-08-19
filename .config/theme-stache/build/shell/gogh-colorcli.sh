#!/usr/bin/env bash

# Source:   gogh
# Theme:    Colorcli
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "d7/00/00"
    print_osc4 2 "5f/af/00"
    print_osc4 3 "5f/af/00"
    print_osc4 4 "00/5f/87"
    print_osc4 5 "d7/00/00"
    print_osc4 6 "5f/5f/5f"
    print_osc4 7 "e4/e4/e4"
    print_osc4 8 "5f/5f/5f"
    print_osc4 9 "d7/00/00"
    print_osc4 10 "5f/5f/5f"
    print_osc4 11 "ff/ff/00"
    print_osc4 12 "00/87/af"
    print_osc4 13 "00/87/af"
    print_osc4 14 "00/87/af"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "00/5f/87"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "00/5f/87"
    print_osc_rgb 17 "00/5f/87"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d70000"
    print_linux 2 "#5faf00"
    print_linux 3 "#5faf00"
    print_linux 4 "#005f87"
    print_linux 5 "#d70000"
    print_linux 6 "#5f5f5f"
    print_linux 7 "#005f87"
    print_linux 8 "#5f5f5f"
    print_linux 9 "#d70000"
    print_linux 10 "#5f5f5f"
    print_linux 11 "#ffff00"
    print_linux 12 "#0087af"
    print_linux 13 "#0087af"
    print_linux 14 "#0087af"
    print_linux 15 "#ffffff"
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
