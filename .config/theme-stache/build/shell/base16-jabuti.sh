#!/usr/bin/env bash

# Source:   base16
# Theme:    Jabuti
# Author:   https://github.com/notusknot
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
    print_osc4 0 "29/2a/37"
    print_osc4 1 "ec/6a/88"
    print_osc4 2 "3f/da/a4"
    print_osc4 3 "e1/c6/97"
    print_osc4 4 "3f/c6/de"
    print_osc4 5 "be/95/ff"
    print_osc4 6 "ff/7e/b6"
    print_osc4 7 "c0/cb/e3"
    print_osc4 8 "45/47/5d"
    print_osc4 9 "ec/6a/88"
    print_osc4 10 "3f/da/a4"
    print_osc4 11 "e1/c6/97"
    print_osc4 12 "3f/c6/de"
    print_osc4 13 "be/95/ff"
    print_osc4 14 "ff/7e/b6"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c0/cb/e3"
    print_osc_rgb 11 "29/2a/37"
    print_osc_rgb 12 "c0/cb/e3"
    print_osc_rgb 17 "d9/e0/ee"
    print_osc_rgb 19 "34/35/45"
}

do_linux() {
    print_linux 0 "#292a37"
    print_linux 1 "#ec6a88"
    print_linux 2 "#3fdaa4"
    print_linux 3 "#e1c697"
    print_linux 4 "#3fc6de"
    print_linux 5 "#be95ff"
    print_linux 6 "#ff7eb6"
    print_linux 7 "#c0cbe3"
    print_linux 8 "#45475d"
    print_linux 9 "#ec6a88"
    print_linux 10 "#3fdaa4"
    print_linux 11 "#e1c697"
    print_linux 12 "#3fc6de"
    print_linux 13 "#be95ff"
    print_linux 14 "#ff7eb6"
    print_linux 15 "#ffffff"
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
