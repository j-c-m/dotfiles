#!/usr/bin/env bash

# Source:   base24
# Theme:    Bluloco Dark
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "1e/20/27"
    print_osc4 1 "f7/10/41"
    print_osc4 2 "23/97/4a"
    print_osc4 3 "18/9f/fd"
    print_osc4 4 "28/5a/fe"
    print_osc4 5 "8c/62/fd"
    print_osc4 6 "36/6f/99"
    print_osc4 7 "b1/ba/c9"
    print_osc4 8 "7b/84/94"
    print_osc4 9 "fb/49/6d"
    print_osc4 10 "37/bc/58"
    print_osc4 11 "f6/bd/47"
    print_osc4 12 "18/9f/fd"
    print_osc4 13 "fb/57/f6"
    print_osc4 14 "4f/ab/ad"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "b1/ba/c9"
    print_osc_rgb 11 "1e/20/27"
    print_osc_rgb 12 "b1/ba/c9"
    print_osc_rgb 17 "cc/d5/e4"
    print_osc_rgb 19 "49/4f/5c"
}

do_linux() {
    print_linux 0 "#1e2027"
    print_linux 1 "#f71041"
    print_linux 2 "#23974a"
    print_linux 3 "#189ffd"
    print_linux 4 "#285afe"
    print_linux 5 "#8c62fd"
    print_linux 6 "#366f99"
    print_linux 7 "#b1bac9"
    print_linux 8 "#7b8494"
    print_linux 9 "#fb496d"
    print_linux 10 "#37bc58"
    print_linux 11 "#f6bd47"
    print_linux 12 "#189ffd"
    print_linux 13 "#fb57f6"
    print_linux 14 "#4fabad"
    print_linux 15 "#fefefe"
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
