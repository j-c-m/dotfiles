#!/usr/bin/env bash

# Source:   base16
# Theme:    Evenok Dark
# Author:   Mekeor Melire
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "f5/70/8a"
    print_osc4 2 "54/bc/5c"
    print_osc4 3 "b8/a3/00"
    print_osc4 4 "00/af/f2"
    print_osc4 5 "90/95/ff"
    print_osc4 6 "00/ba/b3"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "50/50/50"
    print_osc4 9 "f5/70/8a"
    print_osc4 10 "54/bc/5c"
    print_osc4 11 "b8/a3/00"
    print_osc4 12 "00/af/f2"
    print_osc4 13 "90/95/ff"
    print_osc4 14 "00/ba/b3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "20/20/20"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f5708a"
    print_linux 2 "#54bc5c"
    print_linux 3 "#b8a300"
    print_linux 4 "#00aff2"
    print_linux 5 "#9095ff"
    print_linux 6 "#00bab3"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#505050"
    print_linux 9 "#f5708a"
    print_linux 10 "#54bc5c"
    print_linux 11 "#b8a300"
    print_linux 12 "#00aff2"
    print_linux 13 "#9095ff"
    print_linux 14 "#00bab3"
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
