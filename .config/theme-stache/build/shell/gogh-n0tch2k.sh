#!/usr/bin/env bash

# Source:   gogh
# Theme:    N0Tch2K
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
    print_osc4 0 "38/38/38"
    print_osc4 1 "a9/55/51"
    print_osc4 2 "66/66/66"
    print_osc4 3 "a9/80/51"
    print_osc4 4 "65/7d/3e"
    print_osc4 5 "76/76/76"
    print_osc4 6 "c9/c9/c9"
    print_osc4 7 "d0/b8/a3"
    print_osc4 8 "47/47/47"
    print_osc4 9 "a9/77/75"
    print_osc4 10 "8c/8c/8c"
    print_osc4 11 "a9/91/75"
    print_osc4 12 "98/bd/5e"
    print_osc4 13 "a3/a3/a3"
    print_osc4 14 "dc/dc/dc"
    print_osc4 15 "d8/c8/bb"

    print_osc_rgb 10 "a0/a0/a0"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "a0/a0/a0"
    print_osc_rgb 17 "a0/a0/a0"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#383838"
    print_linux 1 "#a95551"
    print_linux 2 "#666666"
    print_linux 3 "#a98051"
    print_linux 4 "#657d3e"
    print_linux 5 "#767676"
    print_linux 6 "#c9c9c9"
    print_linux 7 "#a0a0a0"
    print_linux 8 "#474747"
    print_linux 9 "#a97775"
    print_linux 10 "#8c8c8c"
    print_linux 11 "#a99175"
    print_linux 12 "#98bd5e"
    print_linux 13 "#a3a3a3"
    print_linux 14 "#dcdcdc"
    print_linux 15 "#d8c8bb"
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
