#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ocean Dark
# Author:   
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
    print_osc4 0 "4f/4f/4f"
    print_osc4 1 "af/4b/57"
    print_osc4 2 "af/d3/83"
    print_osc4 3 "e5/c0/79"
    print_osc4 4 "7d/90/a4"
    print_osc4 5 "a4/79/9d"
    print_osc4 6 "85/a6/a5"
    print_osc4 7 "ee/ed/ee"
    print_osc4 8 "7b/7b/7b"
    print_osc4 9 "af/4b/57"
    print_osc4 10 "ce/ff/ab"
    print_osc4 11 "ff/fe/cc"
    print_osc4 12 "b5/dc/fe"
    print_osc4 13 "fb/9b/fe"
    print_osc4 14 "df/df/fd"
    print_osc4 15 "fe/ff/fe"

    print_osc_rgb 10 "97/9c/ac"
    print_osc_rgb 11 "1c/1f/27"
    print_osc_rgb 12 "97/9c/ac"
    print_osc_rgb 17 "97/9c/ac"
    print_osc_rgb 19 "1c/1f/27"
}

do_linux() {
    print_linux 0 "#4f4f4f"
    print_linux 1 "#af4b57"
    print_linux 2 "#afd383"
    print_linux 3 "#e5c079"
    print_linux 4 "#7d90a4"
    print_linux 5 "#a4799d"
    print_linux 6 "#85a6a5"
    print_linux 7 "#979cac"
    print_linux 8 "#7b7b7b"
    print_linux 9 "#af4b57"
    print_linux 10 "#ceffab"
    print_linux 11 "#fffecc"
    print_linux 12 "#b5dcfe"
    print_linux 13 "#fb9bfe"
    print_linux 14 "#dfdffd"
    print_linux 15 "#fefffe"
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
