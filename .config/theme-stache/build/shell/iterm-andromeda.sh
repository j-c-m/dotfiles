#!/usr/bin/env bash

# Source:   iterm
# Theme:    Andromeda
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cd/31/31"
    print_osc4 2 "05/bc/79"
    print_osc4 3 "e5/e5/12"
    print_osc4 4 "24/72/c8"
    print_osc4 5 "bc/3f/bc"
    print_osc4 6 "0f/a8/cd"
    print_osc4 7 "e5/e5/e5"
    print_osc4 8 "66/66/66"
    print_osc4 9 "cd/31/31"
    print_osc4 10 "05/bc/79"
    print_osc4 11 "e5/e5/12"
    print_osc4 12 "24/72/c8"
    print_osc4 13 "bc/3f/bc"
    print_osc4 14 "0f/a8/cd"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "e5/e5/e5"
    print_osc_rgb 11 "26/2a/33"
    print_osc_rgb 12 "f8/f8/f0"
    print_osc_rgb 17 "5a/5c/62"
    print_osc_rgb 19 "ec/e7/e7"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cd3131"
    print_linux 2 "#05bc79"
    print_linux 3 "#e5e512"
    print_linux 4 "#2472c8"
    print_linux 5 "#bc3fbc"
    print_linux 6 "#0fa8cd"
    print_linux 7 "#e5e5e5"
    print_linux 8 "#666666"
    print_linux 9 "#cd3131"
    print_linux 10 "#05bc79"
    print_linux 11 "#e5e512"
    print_linux 12 "#2472c8"
    print_linux 13 "#bc3fbc"
    print_linux 14 "#0fa8cd"
    print_linux 15 "#e5e5e5"
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
