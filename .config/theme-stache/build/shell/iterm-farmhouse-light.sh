#!/usr/bin/env bash

# Source:   iterm
# Theme:    farmhouse-light
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "1d/20/27"
    print_osc4 1 "8d/00/03"
    print_osc4 2 "3a/7d/00"
    print_osc4 3 "a9/56/00"
    print_osc4 4 "09/2c/cd"
    print_osc4 5 "82/00/46"
    print_osc4 6 "22/92/56"
    print_osc4 7 "e8/e4/e1"
    print_osc4 8 "39/40/47"
    print_osc4 9 "eb/00/09"
    print_osc4 10 "7a/c1/00"
    print_osc4 11 "ea/9a/00"
    print_osc4 12 "00/6e/fe"
    print_osc4 13 "bf/3b/7f"
    print_osc4 14 "19/e0/62"
    print_osc4 15 "f4/ee/f0"

    print_osc_rgb 10 "1d/20/27"
    print_osc_rgb 11 "e8/e4/e1"
    print_osc_rgb 12 "00/6e/fe"
    print_osc_rgb 17 "b3/b1/aa"
    print_osc_rgb 19 "4d/56/58"
}

do_linux() {
    print_linux 0 "#1d2027"
    print_linux 1 "#8d0003"
    print_linux 2 "#3a7d00"
    print_linux 3 "#a95600"
    print_linux 4 "#092ccd"
    print_linux 5 "#820046"
    print_linux 6 "#229256"
    print_linux 7 "#1d2027"
    print_linux 8 "#394047"
    print_linux 9 "#eb0009"
    print_linux 10 "#7ac100"
    print_linux 11 "#ea9a00"
    print_linux 12 "#006efe"
    print_linux 13 "#bf3b7f"
    print_linux 14 "#19e062"
    print_linux 15 "#f4eef0"
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
