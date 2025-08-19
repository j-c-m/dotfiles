#!/usr/bin/env bash

# Source:   gogh
# Theme:    Laserwave
# Author:   
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
    print_osc4 0 "39/24/3a"
    print_osc4 1 "eb/64/b9"
    print_osc4 2 "af/d6/86"
    print_osc4 3 "fe/ae/87"
    print_osc4 4 "40/b4/c4"
    print_osc4 5 "b3/81/c5"
    print_osc4 6 "21/59/69"
    print_osc4 7 "91/88/9b"
    print_osc4 8 "71/64/85"
    print_osc4 9 "fc/23/77"
    print_osc4 10 "50/fa/7b"
    print_osc4 11 "ff/e2/61"
    print_osc4 12 "74/df/c4"
    print_osc4 13 "6d/75/e0"
    print_osc4 14 "b4/dc/e7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e0/e0/e0"
    print_osc_rgb 11 "1f/19/26"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "1f/19/26"
}

do_linux() {
    print_linux 0 "#39243a"
    print_linux 1 "#eb64b9"
    print_linux 2 "#afd686"
    print_linux 3 "#feae87"
    print_linux 4 "#40b4c4"
    print_linux 5 "#b381c5"
    print_linux 6 "#215969"
    print_linux 7 "#e0e0e0"
    print_linux 8 "#716485"
    print_linux 9 "#fc2377"
    print_linux 10 "#50fa7b"
    print_linux 11 "#ffe261"
    print_linux 12 "#74dfc4"
    print_linux 13 "#6d75e0"
    print_linux 14 "#b4dce7"
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
