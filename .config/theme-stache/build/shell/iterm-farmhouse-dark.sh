#!/usr/bin/env bash

# Source:   iterm
# Theme:    farmhouse-dark
# Author:   unknown
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
    print_osc4 0 "1d/20/27"
    print_osc4 1 "ba/00/04"
    print_osc4 2 "54/9d/00"
    print_osc4 3 "c8/73/00"
    print_osc4 4 "00/49/e6"
    print_osc4 5 "9f/1b/61"
    print_osc4 6 "1f/b6/5c"
    print_osc4 7 "e8/e4/e1"
    print_osc4 8 "39/40/47"
    print_osc4 9 "eb/00/09"
    print_osc4 10 "7a/c1/00"
    print_osc4 11 "ea/9a/00"
    print_osc4 12 "00/6e/fe"
    print_osc4 13 "bf/3b/7f"
    print_osc4 14 "19/e0/62"
    print_osc4 15 "f4/ee/f0"

    print_osc_rgb 10 "e8/e4/e1"
    print_osc_rgb 11 "1d/20/27"
    print_osc_rgb 12 "00/6e/fe"
    print_osc_rgb 17 "4d/56/58"
    print_osc_rgb 19 "b3/b1/aa"
}

do_linux() {
    print_linux 0 "#1d2027"
    print_linux 1 "#ba0004"
    print_linux 2 "#549d00"
    print_linux 3 "#c87300"
    print_linux 4 "#0049e6"
    print_linux 5 "#9f1b61"
    print_linux 6 "#1fb65c"
    print_linux 7 "#e8e4e1"
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
