#!/usr/bin/env bash

# Source:   iterm
# Theme:    SpaceGray Bright
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
    print_osc4 0 "08/08/08"
    print_osc4 1 "bc/55/53"
    print_osc4 2 "a0/b5/6c"
    print_osc4 3 "f6/c9/87"
    print_osc4 4 "7b/ae/c1"
    print_osc4 5 "b9/8a/ae"
    print_osc4 6 "85/c9/b8"
    print_osc4 7 "d8/d8/d8"
    print_osc4 8 "62/62/62"
    print_osc4 9 "bc/55/53"
    print_osc4 10 "a0/b5/6c"
    print_osc4 11 "f6/c9/87"
    print_osc4 12 "7b/ae/c1"
    print_osc4 13 "b9/8a/ae"
    print_osc4 14 "85/c9/b8"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "f3/f3/f3"
    print_osc_rgb 11 "2a/2e/3a"
    print_osc_rgb 12 "c6/c6/c6"
    print_osc_rgb 17 "ca/ca/ca"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#080808"
    print_linux 1 "#bc5553"
    print_linux 2 "#a0b56c"
    print_linux 3 "#f6c987"
    print_linux 4 "#7baec1"
    print_linux 5 "#b98aae"
    print_linux 6 "#85c9b8"
    print_linux 7 "#f3f3f3"
    print_linux 8 "#626262"
    print_linux 9 "#bc5553"
    print_linux 10 "#a0b56c"
    print_linux 11 "#f6c987"
    print_linux 12 "#7baec1"
    print_linux 13 "#b98aae"
    print_linux 14 "#85c9b8"
    print_linux 15 "#f7f7f7"
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
