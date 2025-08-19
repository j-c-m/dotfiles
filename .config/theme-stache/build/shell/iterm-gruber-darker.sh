#!/usr/bin/env bash

# Source:   iterm
# Theme:    gruber-darker
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
    print_osc4 0 "18/17/17"
    print_osc4 1 "fe/0a/36"
    print_osc4 2 "41/dc/00"
    print_osc4 3 "fe/db/00"
    print_osc4 4 "92/a6/cb"
    print_osc4 5 "9f/94/ca"
    print_osc4 6 "90/a9/9e"
    print_osc4 7 "e4/e3/e3"
    print_osc4 8 "53/48/4e"
    print_osc4 9 "fe/37/50"
    print_osc4 10 "41/dc/00"
    print_osc4 11 "fe/db/00"
    print_osc4 12 "92/a6/cb"
    print_osc4 13 "af/ae/da"
    print_osc4 14 "90/a9/9e"
    print_osc4 15 "f5/f4/f4"

    print_osc_rgb 10 "e4/e3/e3"
    print_osc_rgb 11 "18/17/17"
    print_osc_rgb 12 "fe/db/00"
    print_osc_rgb 17 "fe/fe/fe"
    print_osc_rgb 19 "53/48/4e"
}

do_linux() {
    print_linux 0 "#181717"
    print_linux 1 "#fe0a36"
    print_linux 2 "#41dc00"
    print_linux 3 "#fedb00"
    print_linux 4 "#92a6cb"
    print_linux 5 "#9f94ca"
    print_linux 6 "#90a99e"
    print_linux 7 "#e4e3e3"
    print_linux 8 "#53484e"
    print_linux 9 "#fe3750"
    print_linux 10 "#41dc00"
    print_linux 11 "#fedb00"
    print_linux 12 "#92a6cb"
    print_linux 13 "#afaeda"
    print_linux 14 "#90a99e"
    print_linux 15 "#f5f4f4"
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
