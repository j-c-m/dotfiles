#!/usr/bin/env bash

# Source:   iterm
# Theme:    Glacier
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
    print_osc4 0 "2e/34/3c"
    print_osc4 1 "bd/0f/2f"
    print_osc4 2 "35/a7/70"
    print_osc4 3 "fb/94/35"
    print_osc4 4 "1f/58/72"
    print_osc4 5 "bd/25/23"
    print_osc4 6 "77/83/97"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "40/4a/55"
    print_osc4 9 "bd/0f/2f"
    print_osc4 10 "49/e9/98"
    print_osc4 11 "fd/df/6e"
    print_osc4 12 "2a/8b/c1"
    print_osc4 13 "ea/47/27"
    print_osc4 14 "a0/b6/d3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "0c/11/15"
    print_osc_rgb 12 "6c/6c/6c"
    print_osc_rgb 17 "bd/25/23"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#2e343c"
    print_linux 1 "#bd0f2f"
    print_linux 2 "#35a770"
    print_linux 3 "#fb9435"
    print_linux 4 "#1f5872"
    print_linux 5 "#bd2523"
    print_linux 6 "#778397"
    print_linux 7 "#ffffff"
    print_linux 8 "#404a55"
    print_linux 9 "#bd0f2f"
    print_linux 10 "#49e998"
    print_linux 11 "#fddf6e"
    print_linux 12 "#2a8bc1"
    print_linux 13 "#ea4727"
    print_linux 14 "#a0b6d3"
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
