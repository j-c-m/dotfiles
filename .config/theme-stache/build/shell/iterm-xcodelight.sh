#!/usr/bin/env bash

# Source:   iterm
# Theme:    xcodelight
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
    print_osc4 0 "b4/d8/fd"
    print_osc4 1 "d1/2f/1b"
    print_osc4 2 "3e/80/87"
    print_osc4 3 "78/49/2a"
    print_osc4 4 "0f/68/a0"
    print_osc4 5 "ad/3d/a4"
    print_osc4 6 "80/4f/b8"
    print_osc4 7 "26/26/26"
    print_osc4 8 "8a/99/a6"
    print_osc4 9 "d1/2f/1b"
    print_osc4 10 "23/57/5c"
    print_osc4 11 "78/49/2a"
    print_osc4 12 "0b/4f/79"
    print_osc4 13 "ad/3d/a4"
    print_osc4 14 "4b/21/b0"
    print_osc4 15 "26/26/26"

    print_osc_rgb 10 "26/26/26"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "26/26/26"
    print_osc_rgb 17 "b4/d8/fd"
    print_osc_rgb 19 "26/26/26"
}

do_linux() {
    print_linux 0 "#b4d8fd"
    print_linux 1 "#d12f1b"
    print_linux 2 "#3e8087"
    print_linux 3 "#78492a"
    print_linux 4 "#0f68a0"
    print_linux 5 "#ad3da4"
    print_linux 6 "#804fb8"
    print_linux 7 "#262626"
    print_linux 8 "#8a99a6"
    print_linux 9 "#d12f1b"
    print_linux 10 "#23575c"
    print_linux 11 "#78492a"
    print_linux 12 "#0b4f79"
    print_linux 13 "#ad3da4"
    print_linux 14 "#4b21b0"
    print_linux 15 "#262626"
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
