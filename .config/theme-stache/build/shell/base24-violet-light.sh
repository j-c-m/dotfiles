#!/usr/bin/env bash

# Source:   base24
# Theme:    Violet Light
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "fc/f4/dc"
    print_osc4 1 "c9/4c/22"
    print_osc4 2 "85/98/1c"
    print_osc4 3 "20/75/c7"
    print_osc4 4 "2e/8b/ce"
    print_osc4 5 "d1/3a/82"
    print_osc4 6 "32/a1/98"
    print_osc4 7 "af/ae/a9"
    print_osc4 8 "68/6a/6a"
    print_osc4 9 "bd/36/12"
    print_osc4 10 "72/89/03"
    print_osc4 11 "a5/77/04"
    print_osc4 12 "20/75/c7"
    print_osc4 13 "c6/1b/6e"
    print_osc4 14 "25/91/85"
    print_osc4 15 "c8/c5/bd"

    print_osc_rgb 10 "af/ae/a9"
    print_osc_rgb 11 "fc/f4/dc"
    print_osc_rgb 12 "af/ae/a9"
    print_osc_rgb 17 "d3/d0/c9"
    print_osc_rgb 19 "56/59/5c"
}

do_linux() {
    print_linux 0 "#fcf4dc"
    print_linux 1 "#c94c22"
    print_linux 2 "#85981c"
    print_linux 3 "#2075c7"
    print_linux 4 "#2e8bce"
    print_linux 5 "#d13a82"
    print_linux 6 "#32a198"
    print_linux 7 "#afaea9"
    print_linux 8 "#686a6a"
    print_linux 9 "#bd3612"
    print_linux 10 "#728903"
    print_linux 11 "#a57704"
    print_linux 12 "#2075c7"
    print_linux 13 "#c61b6e"
    print_linux 14 "#259185"
    print_linux 15 "#c8c5bd"
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
