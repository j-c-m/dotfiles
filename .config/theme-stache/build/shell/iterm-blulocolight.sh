#!/usr/bin/env bash

# Source:   iterm
# Theme:    BlulocoLight
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
    print_osc4 0 "37/3a/41"
    print_osc4 1 "d5/26/52"
    print_osc4 2 "23/97/49"
    print_osc4 3 "df/62/1b"
    print_osc4 4 "27/5f/e4"
    print_osc4 5 "82/3e/f0"
    print_osc4 6 "26/60/8c"
    print_osc4 7 "b9/ba/c1"
    print_osc4 8 "67/6a/77"
    print_osc4 9 "ff/63/7f"
    print_osc4 10 "3c/bc/66"
    print_osc4 11 "c5/a2/31"
    print_osc4 12 "00/99/e0"
    print_osc4 13 "ce/32/c0"
    print_osc4 14 "6d/92/ba"
    print_osc4 15 "d3/d3/d3"

    print_osc_rgb 10 "37/3a/41"
    print_osc_rgb 11 "f9/f9/f9"
    print_osc_rgb 12 "f2/26/58"
    print_osc_rgb 17 "d9/ef/ff"
    print_osc_rgb 19 "37/3a/41"
}

do_linux() {
    print_linux 0 "#373a41"
    print_linux 1 "#d52652"
    print_linux 2 "#239749"
    print_linux 3 "#df621b"
    print_linux 4 "#275fe4"
    print_linux 5 "#823ef0"
    print_linux 6 "#26608c"
    print_linux 7 "#373a41"
    print_linux 8 "#676a77"
    print_linux 9 "#ff637f"
    print_linux 10 "#3cbc66"
    print_linux 11 "#c5a231"
    print_linux 12 "#0099e0"
    print_linux 13 "#ce32c0"
    print_linux 14 "#6d92ba"
    print_linux 15 "#d3d3d3"
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
