#!/usr/bin/env bash

# Source:   iterm
# Theme:    UltraViolent
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
    print_osc4 0 "23/26/28"
    print_osc4 1 "ff/00/90"
    print_osc4 2 "b5/ff/00"
    print_osc4 3 "ff/f7/27"
    print_osc4 4 "47/df/fb"
    print_osc4 5 "d6/30/ff"
    print_osc4 6 "0e/ff/bb"
    print_osc4 7 "e1/e1/e1"
    print_osc4 8 "62/65/66"
    print_osc4 9 "fb/57/b4"
    print_osc4 10 "de/ff/8b"
    print_osc4 11 "eb/df/86"
    print_osc4 12 "7f/eb/ff"
    print_osc4 13 "e6/81/ff"
    print_osc4 14 "68/fc/d2"
    print_osc4 15 "f9/f9/f4"

    print_osc_rgb 10 "c1/c1/c1"
    print_osc_rgb 11 "24/27/28"
    print_osc_rgb 12 "c1/c1/c1"
    print_osc_rgb 17 "57/4b/49"
    print_osc_rgb 19 "c3/c7/cb"
}

do_linux() {
    print_linux 0 "#232628"
    print_linux 1 "#ff0090"
    print_linux 2 "#b5ff00"
    print_linux 3 "#fff727"
    print_linux 4 "#47dffb"
    print_linux 5 "#d630ff"
    print_linux 6 "#0effbb"
    print_linux 7 "#c1c1c1"
    print_linux 8 "#626566"
    print_linux 9 "#fb57b4"
    print_linux 10 "#deff8b"
    print_linux 11 "#ebdf86"
    print_linux 12 "#7febff"
    print_linux 13 "#e681ff"
    print_linux 14 "#68fcd2"
    print_linux 15 "#f9f9f4"
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
