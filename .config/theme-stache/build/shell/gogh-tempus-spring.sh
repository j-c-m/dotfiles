#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Spring
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "28/3a/37"
    print_osc4 1 "ff/8b/5f"
    print_osc4 2 "5e/c0/4d"
    print_osc4 3 "b0/b0/1a"
    print_osc4 4 "39/ba/ce"
    print_osc4 5 "e9/93/99"
    print_osc4 6 "36/c0/8e"
    print_osc4 7 "99/af/ae"
    print_osc4 8 "2a/45/3d"
    print_osc4 9 "e1/9e/00"
    print_osc4 10 "73/be/0d"
    print_osc4 11 "c6/a8/43"
    print_osc4 12 "70/af/ef"
    print_osc4 13 "d0/95/e2"
    print_osc4 14 "3c/bf/af"
    print_osc4 15 "b5/b8/b7"

    print_osc_rgb 10 "b5/b8/b7"
    print_osc_rgb 11 "28/3a/37"
    print_osc_rgb 12 "b5/b8/b7"
    print_osc_rgb 17 "b5/b8/b7"
    print_osc_rgb 19 "28/3a/37"
}

do_linux() {
    print_linux 0 "#283a37"
    print_linux 1 "#ff8b5f"
    print_linux 2 "#5ec04d"
    print_linux 3 "#b0b01a"
    print_linux 4 "#39bace"
    print_linux 5 "#e99399"
    print_linux 6 "#36c08e"
    print_linux 7 "#b5b8b7"
    print_linux 8 "#2a453d"
    print_linux 9 "#e19e00"
    print_linux 10 "#73be0d"
    print_linux 11 "#c6a843"
    print_linux 12 "#70afef"
    print_linux 13 "#d095e2"
    print_linux 14 "#3cbfaf"
    print_linux 15 "#b5b8b7"
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
