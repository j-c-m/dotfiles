#!/usr/bin/env bash

# Source:   base16
# Theme:    selenized-dark
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
    print_osc4 0 "10/3c/48"
    print_osc4 1 "fa/57/50"
    print_osc4 2 "75/b9/38"
    print_osc4 3 "db/b3/2d"
    print_osc4 4 "46/95/f7"
    print_osc4 5 "af/88/eb"
    print_osc4 6 "41/c7/b9"
    print_osc4 7 "ad/bc/bc"
    print_osc4 8 "72/89/8f"
    print_osc4 9 "fa/57/50"
    print_osc4 10 "75/b9/38"
    print_osc4 11 "db/b3/2d"
    print_osc4 12 "46/95/f7"
    print_osc4 13 "af/88/eb"
    print_osc4 14 "41/c7/b9"
    print_osc4 15 "ca/d8/d9"

    print_osc_rgb 10 "ad/bc/bc"
    print_osc_rgb 11 "10/3c/48"
    print_osc_rgb 12 "ad/bc/bc"
    print_osc_rgb 17 "ca/d8/d9"
    print_osc_rgb 19 "18/49/56"
}

do_linux() {
    print_linux 0 "#103c48"
    print_linux 1 "#fa5750"
    print_linux 2 "#75b938"
    print_linux 3 "#dbb32d"
    print_linux 4 "#4695f7"
    print_linux 5 "#af88eb"
    print_linux 6 "#41c7b9"
    print_linux 7 "#adbcbc"
    print_linux 8 "#72898f"
    print_linux 9 "#fa5750"
    print_linux 10 "#75b938"
    print_linux 11 "#dbb32d"
    print_linux 12 "#4695f7"
    print_linux 13 "#af88eb"
    print_linux 14 "#41c7b9"
    print_linux 15 "#cad8d9"
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
