#!/usr/bin/env bash

# Source:   iterm
# Theme:    Operator Mono Dark
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
    print_osc4 0 "5a/5a/5a"
    print_osc4 1 "ca/37/2d"
    print_osc4 2 "4d/7b/3a"
    print_osc4 3 "d4/d6/97"
    print_osc4 4 "43/87/cf"
    print_osc4 5 "b8/6c/b4"
    print_osc4 6 "72/d4/c6"
    print_osc4 7 "cd/d3/cd"
    print_osc4 8 "9a/9a/99"
    print_osc4 9 "c3/7d/62"
    print_osc4 10 "83/d0/a2"
    print_osc4 11 "fd/fd/c5"
    print_osc4 12 "89/d3/f6"
    print_osc4 13 "fe/2c/79"
    print_osc4 14 "82/e9/da"
    print_osc4 15 "fd/fd/f6"

    print_osc_rgb 10 "c3/ca/c2"
    print_osc_rgb 11 "19/19/19"
    print_osc_rgb 12 "fc/dc/07"
    print_osc_rgb 17 "19/27/3b"
    print_osc_rgb 19 "dd/e5/dc"
}

do_linux() {
    print_linux 0 "#5a5a5a"
    print_linux 1 "#ca372d"
    print_linux 2 "#4d7b3a"
    print_linux 3 "#d4d697"
    print_linux 4 "#4387cf"
    print_linux 5 "#b86cb4"
    print_linux 6 "#72d4c6"
    print_linux 7 "#c3cac2"
    print_linux 8 "#9a9a99"
    print_linux 9 "#c37d62"
    print_linux 10 "#83d0a2"
    print_linux 11 "#fdfdc5"
    print_linux 12 "#89d3f6"
    print_linux 13 "#fe2c79"
    print_linux 14 "#82e9da"
    print_linux 15 "#fdfdf6"
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
