#!/usr/bin/env bash

# Source:   base24
# Theme:    Cobalt2
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
    print_osc4 0 "12/26/37"
    print_osc4 1 "ff/00/00"
    print_osc4 2 "37/dd/21"
    print_osc4 3 "55/55/ff"
    print_osc4 4 "14/60/d2"
    print_osc4 5 "ff/00/5d"
    print_osc4 6 "00/bb/bb"
    print_osc4 7 "a1/a1/a1"
    print_osc4 8 "6e/6e/6e"
    print_osc4 9 "f4/0d/17"
    print_osc4 10 "3b/cf/1d"
    print_osc4 11 "ec/c8/09"
    print_osc4 12 "55/55/ff"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "6a/e3/f9"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a1/a1/a1"
    print_osc_rgb 11 "12/26/37"
    print_osc_rgb 12 "a1/a1/a1"
    print_osc_rgb 17 "bb/bb/bb"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#122637"
    print_linux 1 "#ff0000"
    print_linux 2 "#37dd21"
    print_linux 3 "#5555ff"
    print_linux 4 "#1460d2"
    print_linux 5 "#ff005d"
    print_linux 6 "#00bbbb"
    print_linux 7 "#a1a1a1"
    print_linux 8 "#6e6e6e"
    print_linux 9 "#f40d17"
    print_linux 10 "#3bcf1d"
    print_linux 11 "#ecc809"
    print_linux 12 "#5555ff"
    print_linux 13 "#ff55ff"
    print_linux 14 "#6ae3f9"
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
