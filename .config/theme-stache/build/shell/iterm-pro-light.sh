#!/usr/bin/env bash

# Source:   iterm
# Theme:    Pro Light
# Author:   unknown
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "e4/49/2b"
    print_osc4 2 "50/d0/48"
    print_osc4 3 "c5/c3/40"
    print_osc4 4 "3a/75/ff"
    print_osc4 5 "ec/65/e7"
    print_osc4 6 "4e/d1/dd"
    print_osc4 7 "dc/dc/dc"
    print_osc4 8 "9f/9f/9f"
    print_osc4 9 "ff/66/40"
    print_osc4 10 "61/ee/56"
    print_osc4 11 "f2/f0/55"
    print_osc4 12 "00/81/ff"
    print_osc4 13 "ff/7d/fe"
    print_osc4 14 "60/f6/f8"
    print_osc4 15 "f1/f1/f1"

    print_osc_rgb 10 "19/19/19"
    print_osc_rgb 11 "fe/ff/ff"
    print_osc_rgb 12 "4d/4d/4d"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "19/19/19"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e4492b"
    print_linux 2 "#50d048"
    print_linux 3 "#c5c340"
    print_linux 4 "#3a75ff"
    print_linux 5 "#ec65e7"
    print_linux 6 "#4ed1dd"
    print_linux 7 "#191919"
    print_linux 8 "#9f9f9f"
    print_linux 9 "#ff6640"
    print_linux 10 "#61ee56"
    print_linux 11 "#f2f055"
    print_linux 12 "#0081ff"
    print_linux 13 "#ff7dfe"
    print_linux 14 "#60f6f8"
    print_linux 15 "#f1f1f1"
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
