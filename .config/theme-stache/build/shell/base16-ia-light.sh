#!/usr/bin/env bash

# Source:   base16
# Theme:    iA Light
# Author:   iA Inc. (modified by aramisgithub)
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
    print_osc4 0 "f6/f6/f6"
    print_osc4 1 "9c/5a/02"
    print_osc4 2 "38/78/1c"
    print_osc4 3 "c4/82/18"
    print_osc4 4 "48/ba/c2"
    print_osc4 5 "a9/45/98"
    print_osc4 6 "2d/6b/b1"
    print_osc4 7 "18/18/18"
    print_osc4 8 "89/89/89"
    print_osc4 9 "9c/5a/02"
    print_osc4 10 "38/78/1c"
    print_osc4 11 "c4/82/18"
    print_osc4 12 "48/ba/c2"
    print_osc4 13 "a9/45/98"
    print_osc4 14 "2d/6b/b1"
    print_osc4 15 "f8/f8/f8"

    print_osc_rgb 10 "18/18/18"
    print_osc_rgb 11 "f6/f6/f6"
    print_osc_rgb 12 "18/18/18"
    print_osc_rgb 17 "e8/e8/e8"
    print_osc_rgb 19 "de/de/de"
}

do_linux() {
    print_linux 0 "#f6f6f6"
    print_linux 1 "#9c5a02"
    print_linux 2 "#38781c"
    print_linux 3 "#c48218"
    print_linux 4 "#48bac2"
    print_linux 5 "#a94598"
    print_linux 6 "#2d6bb1"
    print_linux 7 "#181818"
    print_linux 8 "#898989"
    print_linux 9 "#9c5a02"
    print_linux 10 "#38781c"
    print_linux 11 "#c48218"
    print_linux 12 "#48bac2"
    print_linux 13 "#a94598"
    print_linux 14 "#2d6bb1"
    print_linux 15 "#f8f8f8"
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
