#!/usr/bin/env bash

# Source:   iterm
# Theme:    mellow
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
    print_osc4 0 "27/27/2a"
    print_osc4 1 "f5/a1/91"
    print_osc4 2 "90/b9/9f"
    print_osc4 3 "e6/b9/9d"
    print_osc4 4 "ac/a1/cf"
    print_osc4 5 "e2/9e/ca"
    print_osc4 6 "ea/83/a5"
    print_osc4 7 "c1/c0/d4"
    print_osc4 8 "35/35/39"
    print_osc4 9 "ff/ae/9f"
    print_osc4 10 "9d/c6/ac"
    print_osc4 11 "f0/c5/a9"
    print_osc4 12 "b9/ae/da"
    print_osc4 13 "ec/aa/d6"
    print_osc4 14 "f5/91/b2"
    print_osc4 15 "ca/c9/dd"

    print_osc_rgb 10 "c9/c7/cd"
    print_osc_rgb 11 "16/16/17"
    print_osc_rgb 12 "ca/c9/dd"
    print_osc_rgb 17 "2a/2a/2d"
    print_osc_rgb 19 "c1/c0/d4"
}

do_linux() {
    print_linux 0 "#27272a"
    print_linux 1 "#f5a191"
    print_linux 2 "#90b99f"
    print_linux 3 "#e6b99d"
    print_linux 4 "#aca1cf"
    print_linux 5 "#e29eca"
    print_linux 6 "#ea83a5"
    print_linux 7 "#c9c7cd"
    print_linux 8 "#353539"
    print_linux 9 "#ffae9f"
    print_linux 10 "#9dc6ac"
    print_linux 11 "#f0c5a9"
    print_linux 12 "#b9aeda"
    print_linux 13 "#ecaad6"
    print_linux 14 "#f591b2"
    print_linux 15 "#cac9dd"
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
