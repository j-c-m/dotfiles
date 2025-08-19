#!/usr/bin/env bash

# Source:   iterm
# Theme:    Aura
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
    print_osc4 0 "11/0f/18"
    print_osc4 1 "ff/67/67"
    print_osc4 2 "61/ff/ca"
    print_osc4 3 "ff/ca/85"
    print_osc4 4 "a2/77/ff"
    print_osc4 5 "a2/77/ff"
    print_osc4 6 "61/ff/ca"
    print_osc4 7 "ed/ec/ee"
    print_osc4 8 "4d/4d/4d"
    print_osc4 9 "ff/ca/85"
    print_osc4 10 "a2/77/ff"
    print_osc4 11 "ff/ca/85"
    print_osc4 12 "a2/77/ff"
    print_osc4 13 "a2/77/ff"
    print_osc4 14 "61/ff/ca"
    print_osc4 15 "ed/ec/ee"

    print_osc_rgb 10 "ed/ec/ee"
    print_osc_rgb 11 "15/14/1b"
    print_osc_rgb 12 "a2/77/ff"
    print_osc_rgb 17 "a2/77/ff"
    print_osc_rgb 19 "ed/ec/ee"
}

do_linux() {
    print_linux 0 "#110f18"
    print_linux 1 "#ff6767"
    print_linux 2 "#61ffca"
    print_linux 3 "#ffca85"
    print_linux 4 "#a277ff"
    print_linux 5 "#a277ff"
    print_linux 6 "#61ffca"
    print_linux 7 "#edecee"
    print_linux 8 "#4d4d4d"
    print_linux 9 "#ffca85"
    print_linux 10 "#a277ff"
    print_linux 11 "#ffca85"
    print_linux 12 "#a277ff"
    print_linux 13 "#a277ff"
    print_linux 14 "#61ffca"
    print_linux 15 "#edecee"
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
