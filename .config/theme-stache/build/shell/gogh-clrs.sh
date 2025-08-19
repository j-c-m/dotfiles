#!/usr/bin/env bash

# Source:   gogh
# Theme:    Clrs
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
    print_osc4 1 "f8/28/2a"
    print_osc4 2 "32/8a/5d"
    print_osc4 3 "fa/70/1d"
    print_osc4 4 "13/5c/d0"
    print_osc4 5 "9f/00/bd"
    print_osc4 6 "33/c3/c1"
    print_osc4 7 "b3/b3/b3"
    print_osc4 8 "55/57/53"
    print_osc4 9 "fb/04/16"
    print_osc4 10 "2c/c6/31"
    print_osc4 11 "fd/d7/27"
    print_osc4 12 "16/70/ff"
    print_osc4 13 "e9/00/b0"
    print_osc4 14 "3a/d5/ce"
    print_osc4 15 "ee/ee/ec"

    print_osc_rgb 10 "26/26/26"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "26/26/26"
    print_osc_rgb 17 "26/26/26"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f8282a"
    print_linux 2 "#328a5d"
    print_linux 3 "#fa701d"
    print_linux 4 "#135cd0"
    print_linux 5 "#9f00bd"
    print_linux 6 "#33c3c1"
    print_linux 7 "#262626"
    print_linux 8 "#555753"
    print_linux 9 "#fb0416"
    print_linux 10 "#2cc631"
    print_linux 11 "#fdd727"
    print_linux 12 "#1670ff"
    print_linux 13 "#e900b0"
    print_linux 14 "#3ad5ce"
    print_linux 15 "#eeeeec"
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
