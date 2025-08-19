#!/usr/bin/env bash

# Source:   base16
# Theme:    Colors
# Author:   mrmrs (http://clrs.cc)
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
    print_osc4 0 "11/11/11"
    print_osc4 1 "ff/41/36"
    print_osc4 2 "2e/cc/40"
    print_osc4 3 "ff/dc/00"
    print_osc4 4 "00/74/d9"
    print_osc4 5 "b1/0d/c9"
    print_osc4 6 "7f/db/ff"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "77/77/77"
    print_osc4 9 "ff/41/36"
    print_osc4 10 "2e/cc/40"
    print_osc4 11 "ff/dc/00"
    print_osc4 12 "00/74/d9"
    print_osc4 13 "b1/0d/c9"
    print_osc4 14 "7f/db/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bb/bb/bb"
    print_osc_rgb 11 "11/11/11"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "dd/dd/dd"
    print_osc_rgb 19 "33/33/33"
}

do_linux() {
    print_linux 0 "#111111"
    print_linux 1 "#ff4136"
    print_linux 2 "#2ecc40"
    print_linux 3 "#ffdc00"
    print_linux 4 "#0074d9"
    print_linux 5 "#b10dc9"
    print_linux 6 "#7fdbff"
    print_linux 7 "#bbbbbb"
    print_linux 8 "#777777"
    print_linux 9 "#ff4136"
    print_linux 10 "#2ecc40"
    print_linux 11 "#ffdc00"
    print_linux 12 "#0074d9"
    print_linux 13 "#b10dc9"
    print_linux 14 "#7fdbff"
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
