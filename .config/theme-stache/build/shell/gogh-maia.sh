#!/usr/bin/env bash

# Source:   gogh
# Theme:    Maia
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "23/24/23"
    print_osc4 1 "ba/29/22"
    print_osc4 2 "7e/80/7e"
    print_osc4 3 "4c/4f/4d"
    print_osc4 4 "16/a0/85"
    print_osc4 5 "43/74/6a"
    print_osc4 6 "00/cc/cc"
    print_osc4 7 "e0/e0/e0"
    print_osc4 8 "28/29/28"
    print_osc4 9 "cc/37/2c"
    print_osc4 10 "8d/8f/8d"
    print_osc4 11 "4e/52/4f"
    print_osc4 12 "13/bf/9d"
    print_osc4 13 "48/7d/72"
    print_osc4 14 "00/d1/d1"
    print_osc4 15 "e8/e8/e8"

    print_osc_rgb 10 "bd/c3/c7"
    print_osc_rgb 11 "31/36/3b"
    print_osc_rgb 12 "bd/c3/c7"
    print_osc_rgb 17 "bd/c3/c7"
    print_osc_rgb 19 "31/36/3b"
}

do_linux() {
    print_linux 0 "#232423"
    print_linux 1 "#ba2922"
    print_linux 2 "#7e807e"
    print_linux 3 "#4c4f4d"
    print_linux 4 "#16a085"
    print_linux 5 "#43746a"
    print_linux 6 "#00cccc"
    print_linux 7 "#bdc3c7"
    print_linux 8 "#282928"
    print_linux 9 "#cc372c"
    print_linux 10 "#8d8f8d"
    print_linux 11 "#4e524f"
    print_linux 12 "#13bf9d"
    print_linux 13 "#487d72"
    print_linux 14 "#00d1d1"
    print_linux 15 "#e8e8e8"
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
