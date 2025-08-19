#!/usr/bin/env bash

# Source:   base24
# Theme:    Cobalt Neon
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
    print_osc4 0 "14/28/38"
    print_osc4 1 "ff/23/20"
    print_osc4 2 "3a/a5/ff"
    print_osc4 3 "3c/7d/d2"
    print_osc4 4 "8f/f5/86"
    print_osc4 5 "78/1a/a0"
    print_osc4 6 "8f/f5/86"
    print_osc4 7 "cc/72/a6"
    print_osc4 8 "ee/ca/92"
    print_osc4 9 "d4/31/2e"
    print_osc4 10 "8f/f5/86"
    print_osc4 11 "e9/f0/6d"
    print_osc4 12 "3c/7d/d2"
    print_osc4 13 "82/30/a7"
    print_osc4 14 "6c/bc/67"
    print_osc4 15 "8f/f5/86"

    print_osc_rgb 10 "cc/72/a6"
    print_osc_rgb 11 "14/28/38"
    print_osc_rgb 12 "cc/72/a6"
    print_osc_rgb 17 "ba/45/b1"
    print_osc_rgb 19 "14/26/30"
}

do_linux() {
    print_linux 0 "#142838"
    print_linux 1 "#ff2320"
    print_linux 2 "#3aa5ff"
    print_linux 3 "#3c7dd2"
    print_linux 4 "#8ff586"
    print_linux 5 "#781aa0"
    print_linux 6 "#8ff586"
    print_linux 7 "#cc72a6"
    print_linux 8 "#eeca92"
    print_linux 9 "#d4312e"
    print_linux 10 "#8ff586"
    print_linux 11 "#e9f06d"
    print_linux 12 "#3c7dd2"
    print_linux 13 "#8230a7"
    print_linux 14 "#6cbc67"
    print_linux 15 "#8ff586"
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
