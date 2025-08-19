#!/usr/bin/env bash

# Source:   base24
# Theme:    Ciapre
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "18/1c/27"
    print_osc4 1 "80/00/09"
    print_osc4 2 "48/51/3b"
    print_osc4 3 "2f/97/c6"
    print_osc4 4 "56/6d/8c"
    print_osc4 5 "72/4c/7c"
    print_osc4 6 "5b/4f/4a"
    print_osc4 7 "97/8f/73"
    print_osc4 8 "6b/68/5f"
    print_osc4 9 "ab/38/34"
    print_osc4 10 "a6/a6/5d"
    print_osc4 11 "dc/de/7b"
    print_osc4 12 "2f/97/c6"
    print_osc4 13 "d3/30/60"
    print_osc4 14 "f3/da/b1"
    print_osc4 15 "f3/f3/f3"

    print_osc_rgb 10 "97/8f/73"
    print_osc_rgb 11 "18/1c/27"
    print_osc_rgb 12 "97/8f/73"
    print_osc_rgb 17 "ad/a3/7e"
    print_osc_rgb 19 "18/18/18"
}

do_linux() {
    print_linux 0 "#181c27"
    print_linux 1 "#800009"
    print_linux 2 "#48513b"
    print_linux 3 "#2f97c6"
    print_linux 4 "#566d8c"
    print_linux 5 "#724c7c"
    print_linux 6 "#5b4f4a"
    print_linux 7 "#978f73"
    print_linux 8 "#6b685f"
    print_linux 9 "#ab3834"
    print_linux 10 "#a6a65d"
    print_linux 11 "#dcde7b"
    print_linux 12 "#2f97c6"
    print_linux 13 "#d33060"
    print_linux 14 "#f3dab1"
    print_linux 15 "#f3f3f3"
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
