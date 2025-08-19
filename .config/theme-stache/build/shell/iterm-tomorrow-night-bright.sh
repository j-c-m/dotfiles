#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tomorrow Night Bright
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "d5/4e/53"
    print_osc4 2 "b9/ca/49"
    print_osc4 3 "e7/c5/47"
    print_osc4 4 "79/a6/da"
    print_osc4 5 "c3/97/d8"
    print_osc4 6 "70/c0/b1"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "00/00/00"
    print_osc4 9 "d4/4d/53"
    print_osc4 10 "b9/c9/49"
    print_osc4 11 "e6/c4/46"
    print_osc4 12 "79/a6/da"
    print_osc4 13 "c3/96/d7"
    print_osc4 14 "70/c0/b1"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "e9/e9/e9"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "e9/e9/e9"
    print_osc_rgb 17 "42/42/42"
    print_osc_rgb 19 "e9/e9/e9"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d54e53"
    print_linux 2 "#b9ca49"
    print_linux 3 "#e7c547"
    print_linux 4 "#79a6da"
    print_linux 5 "#c397d8"
    print_linux 6 "#70c0b1"
    print_linux 7 "#e9e9e9"
    print_linux 8 "#000000"
    print_linux 9 "#d44d53"
    print_linux 10 "#b9c949"
    print_linux 11 "#e6c446"
    print_linux 12 "#79a6da"
    print_linux 13 "#c396d7"
    print_linux 14 "#70c0b1"
    print_linux 15 "#fffefe"
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
