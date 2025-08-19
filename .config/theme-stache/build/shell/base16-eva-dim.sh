#!/usr/bin/env bash

# Source:   base16
# Theme:    Eva Dim
# Author:   kjakapat (https://github.com/kjakapat)
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
    print_osc4 0 "2a/3b/4d"
    print_osc4 1 "c4/67/6c"
    print_osc4 2 "5d/e5/61"
    print_osc4 3 "cf/d0/5d"
    print_osc4 4 "1a/e1/dc"
    print_osc4 5 "9c/6c/d3"
    print_osc4 6 "4b/8f/77"
    print_osc4 7 "9f/a2/a6"
    print_osc4 8 "55/79/9c"
    print_osc4 9 "c4/67/6c"
    print_osc4 10 "5d/e5/61"
    print_osc4 11 "cf/d0/5d"
    print_osc4 12 "1a/e1/dc"
    print_osc4 13 "9c/6c/d3"
    print_osc4 14 "4b/8f/77"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "9f/a2/a6"
    print_osc_rgb 11 "2a/3b/4d"
    print_osc_rgb 12 "9f/a2/a6"
    print_osc_rgb 17 "d6/d7/d9"
    print_osc_rgb 19 "3d/56/6f"
}

do_linux() {
    print_linux 0 "#2a3b4d"
    print_linux 1 "#c4676c"
    print_linux 2 "#5de561"
    print_linux 3 "#cfd05d"
    print_linux 4 "#1ae1dc"
    print_linux 5 "#9c6cd3"
    print_linux 6 "#4b8f77"
    print_linux 7 "#9fa2a6"
    print_linux 8 "#55799c"
    print_linux 9 "#c4676c"
    print_linux 10 "#5de561"
    print_linux 11 "#cfd05d"
    print_linux 12 "#1ae1dc"
    print_linux 13 "#9c6cd3"
    print_linux 14 "#4b8f77"
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
