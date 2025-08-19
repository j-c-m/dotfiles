#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ciapre
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
    print_osc4 0 "18/18/18"
    print_osc4 1 "81/00/09"
    print_osc4 2 "48/51/3b"
    print_osc4 3 "cc/8b/3f"
    print_osc4 4 "57/6d/8c"
    print_osc4 5 "72/4d/7c"
    print_osc4 6 "5c/4f/4b"
    print_osc4 7 "ae/a4/7f"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ac/38/35"
    print_osc4 10 "a6/a7/5d"
    print_osc4 11 "dc/df/7c"
    print_osc4 12 "30/97/c6"
    print_osc4 13 "d3/30/61"
    print_osc4 14 "f3/db/b2"
    print_osc4 15 "f4/f4/f4"

    print_osc_rgb 10 "ae/a4/7a"
    print_osc_rgb 11 "19/1c/27"
    print_osc_rgb 12 "ae/a4/7a"
    print_osc_rgb 17 "ae/a4/7a"
    print_osc_rgb 19 "19/1c/27"
}

do_linux() {
    print_linux 0 "#181818"
    print_linux 1 "#810009"
    print_linux 2 "#48513b"
    print_linux 3 "#cc8b3f"
    print_linux 4 "#576d8c"
    print_linux 5 "#724d7c"
    print_linux 6 "#5c4f4b"
    print_linux 7 "#aea47a"
    print_linux 8 "#555555"
    print_linux 9 "#ac3835"
    print_linux 10 "#a6a75d"
    print_linux 11 "#dcdf7c"
    print_linux 12 "#3097c6"
    print_linux 13 "#d33061"
    print_linux 14 "#f3dbb2"
    print_linux 15 "#f4f4f4"
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
