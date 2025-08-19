#!/usr/bin/env bash

# Source:   iterm
# Theme:    xcodelighthc
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "b4/d8/fd"
    print_osc4 1 "ad/18/05"
    print_osc4 2 "35/5d/61"
    print_osc4 3 "78/49/2a"
    print_osc4 4 "00/58/a1"
    print_osc4 5 "9c/21/91"
    print_osc4 6 "70/3d/aa"
    print_osc4 7 "00/00/00"
    print_osc4 8 "8a/99/a6"
    print_osc4 9 "ad/18/05"
    print_osc4 10 "17/41/45"
    print_osc4 11 "78/49/2a"
    print_osc4 12 "00/3f/73"
    print_osc4 13 "9c/21/91"
    print_osc4 14 "44/1e/a1"
    print_osc4 15 "00/00/00"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "b4/d8/fd"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#b4d8fd"
    print_linux 1 "#ad1805"
    print_linux 2 "#355d61"
    print_linux 3 "#78492a"
    print_linux 4 "#0058a1"
    print_linux 5 "#9c2191"
    print_linux 6 "#703daa"
    print_linux 7 "#000000"
    print_linux 8 "#8a99a6"
    print_linux 9 "#ad1805"
    print_linux 10 "#174145"
    print_linux 11 "#78492a"
    print_linux 12 "#003f73"
    print_linux 13 "#9c2191"
    print_linux 14 "#441ea1"
    print_linux 15 "#000000"
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
