#!/usr/bin/env bash

# Source:   gogh
# Theme:    Slate
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
    print_osc4 0 "22/22/22"
    print_osc4 1 "e2/a8/bf"
    print_osc4 2 "81/d7/78"
    print_osc4 3 "c4/c9/c0"
    print_osc4 4 "26/4b/49"
    print_osc4 5 "a4/81/d3"
    print_osc4 6 "15/ab/9c"
    print_osc4 7 "02/c5/e0"
    print_osc4 8 "ff/ff/ff"
    print_osc4 9 "ff/cd/d9"
    print_osc4 10 "be/ff/a8"
    print_osc4 11 "d0/cc/ca"
    print_osc4 12 "7a/b0/d2"
    print_osc4 13 "c5/a7/d9"
    print_osc4 14 "8c/df/e0"
    print_osc4 15 "e0/e0/e0"

    print_osc_rgb 10 "35/b1/d2"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "35/b1/d2"
    print_osc_rgb 17 "35/b1/d2"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#222222"
    print_linux 1 "#e2a8bf"
    print_linux 2 "#81d778"
    print_linux 3 "#c4c9c0"
    print_linux 4 "#264b49"
    print_linux 5 "#a481d3"
    print_linux 6 "#15ab9c"
    print_linux 7 "#35b1d2"
    print_linux 8 "#ffffff"
    print_linux 9 "#ffcdd9"
    print_linux 10 "#beffa8"
    print_linux 11 "#d0ccca"
    print_linux 12 "#7ab0d2"
    print_linux 13 "#c5a7d9"
    print_linux 14 "#8cdfe0"
    print_linux 15 "#e0e0e0"
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
