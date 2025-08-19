#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ura
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
    print_osc4 1 "c2/1b/6f"
    print_osc4 2 "6f/c2/1b"
    print_osc4 3 "c2/6f/1b"
    print_osc4 4 "1b/6f/c2"
    print_osc4 5 "6f/1b/c2"
    print_osc4 6 "1b/c2/6f"
    print_osc4 7 "80/80/80"
    print_osc4 8 "80/80/80"
    print_osc4 9 "ee/84/b9"
    print_osc4 10 "b9/ee/84"
    print_osc4 11 "ee/b9/84"
    print_osc4 12 "84/b9/ee"
    print_osc4 13 "b9/84/ee"
    print_osc4 14 "84/ee/b9"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "23/47/6a"
    print_osc_rgb 11 "fe/ff/ee"
    print_osc_rgb 12 "23/47/6a"
    print_osc_rgb 17 "23/47/6a"
    print_osc_rgb 19 "fe/ff/ee"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c21b6f"
    print_linux 2 "#6fc21b"
    print_linux 3 "#c26f1b"
    print_linux 4 "#1b6fc2"
    print_linux 5 "#6f1bc2"
    print_linux 6 "#1bc26f"
    print_linux 7 "#23476a"
    print_linux 8 "#808080"
    print_linux 9 "#ee84b9"
    print_linux 10 "#b9ee84"
    print_linux 11 "#eeb984"
    print_linux 12 "#84b9ee"
    print_linux 13 "#b984ee"
    print_linux 14 "#84eeb9"
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
