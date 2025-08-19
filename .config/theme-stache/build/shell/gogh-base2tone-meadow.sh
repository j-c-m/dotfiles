#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Meadow
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
    print_osc4 0 "19/28/34"
    print_osc4 1 "27/7f/be"
    print_osc4 2 "80/bf/40"
    print_osc4 3 "a6/f6/55"
    print_osc4 4 "42/99/d7"
    print_osc4 5 "80/bf/40"
    print_osc4 6 "47/ad/f5"
    print_osc4 7 "7b/9e/b7"
    print_osc4 8 "3d/5e/76"
    print_osc4 9 "8c/dd/3c"
    print_osc4 10 "22/36/44"
    print_osc4 11 "33/51/66"
    print_osc4 12 "46/6b/86"
    print_osc4 13 "af/dd/fe"
    print_osc4 14 "73/b2/34"
    print_osc4 15 "d1/ec/ff"

    print_osc_rgb 10 "7b/9e/b7"
    print_osc_rgb 11 "19/28/34"
    print_osc_rgb 12 "4d/82/17"
    print_osc_rgb 17 "7b/9e/b7"
    print_osc_rgb 19 "19/28/34"
}

do_linux() {
    print_linux 0 "#192834"
    print_linux 1 "#277fbe"
    print_linux 2 "#80bf40"
    print_linux 3 "#a6f655"
    print_linux 4 "#4299d7"
    print_linux 5 "#80bf40"
    print_linux 6 "#47adf5"
    print_linux 7 "#7b9eb7"
    print_linux 8 "#3d5e76"
    print_linux 9 "#8cdd3c"
    print_linux 10 "#223644"
    print_linux 11 "#335166"
    print_linux 12 "#466b86"
    print_linux 13 "#afddfe"
    print_linux 14 "#73b234"
    print_linux 15 "#d1ecff"
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
