#!/usr/bin/env bash

# Source:   base24
# Theme:    Material
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "ea/ea/ea"
    print_osc4 1 "b7/14/1e"
    print_osc4 2 "45/7b/23"
    print_osc4 3 "53/a4/f3"
    print_osc4 4 "13/4e/b2"
    print_osc4 5 "55/00/87"
    print_osc4 6 "0e/70/7c"
    print_osc4 7 "c3/c3/c3"
    print_osc4 8 "6d/6d/6d"
    print_osc4 9 "e8/3a/3f"
    print_osc4 10 "7a/ba/39"
    print_osc4 11 "fe/e9/2e"
    print_osc4 12 "53/a4/f3"
    print_osc4 13 "a9/4d/bb"
    print_osc4 14 "26/ba/d1"
    print_osc4 15 "d8/d8/d8"

    print_osc_rgb 10 "c3/c3/c3"
    print_osc_rgb 11 "ea/ea/ea"
    print_osc_rgb 12 "c3/c3/c3"
    print_osc_rgb 17 "ee/ee/ee"
    print_osc_rgb 19 "21/21/21"
}

do_linux() {
    print_linux 0 "#eaeaea"
    print_linux 1 "#b7141e"
    print_linux 2 "#457b23"
    print_linux 3 "#53a4f3"
    print_linux 4 "#134eb2"
    print_linux 5 "#550087"
    print_linux 6 "#0e707c"
    print_linux 7 "#c3c3c3"
    print_linux 8 "#6d6d6d"
    print_linux 9 "#e83a3f"
    print_linux 10 "#7aba39"
    print_linux 11 "#fee92e"
    print_linux 12 "#53a4f3"
    print_linux 13 "#a94dbb"
    print_linux 14 "#26bad1"
    print_linux 15 "#d8d8d8"
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
