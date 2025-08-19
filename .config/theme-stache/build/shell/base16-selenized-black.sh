#!/usr/bin/env bash

# Source:   base16
# Theme:    selenized-black
# Author:   Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
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
    print_osc4 0 "18/18/18"
    print_osc4 1 "ed/4a/46"
    print_osc4 2 "70/b4/33"
    print_osc4 3 "db/b3/2d"
    print_osc4 4 "36/8a/eb"
    print_osc4 5 "a5/80/e2"
    print_osc4 6 "3f/c5/b7"
    print_osc4 7 "b9/b9/b9"
    print_osc4 8 "77/77/77"
    print_osc4 9 "ed/4a/46"
    print_osc4 10 "70/b4/33"
    print_osc4 11 "db/b3/2d"
    print_osc4 12 "36/8a/eb"
    print_osc4 13 "a5/80/e2"
    print_osc4 14 "3f/c5/b7"
    print_osc4 15 "de/de/de"

    print_osc_rgb 10 "b9/b9/b9"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "b9/b9/b9"
    print_osc_rgb 17 "de/de/de"
    print_osc_rgb 19 "25/25/25"
}

do_linux() {
    print_linux 0 "#181818"
    print_linux 1 "#ed4a46"
    print_linux 2 "#70b433"
    print_linux 3 "#dbb32d"
    print_linux 4 "#368aeb"
    print_linux 5 "#a580e2"
    print_linux 6 "#3fc5b7"
    print_linux 7 "#b9b9b9"
    print_linux 8 "#777777"
    print_linux 9 "#ed4a46"
    print_linux 10 "#70b433"
    print_linux 11 "#dbb32d"
    print_linux 12 "#368aeb"
    print_linux 13 "#a580e2"
    print_linux 14 "#3fc5b7"
    print_linux 15 "#dedede"
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
