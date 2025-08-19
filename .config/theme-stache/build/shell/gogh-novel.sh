#!/usr/bin/env bash

# Source:   gogh
# Theme:    Novel
# Author:   
# Variant:  light

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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "cc/00/00"
    print_osc4 2 "00/96/00"
    print_osc4 3 "d0/6b/00"
    print_osc4 4 "00/00/cc"
    print_osc4 5 "cc/00/cc"
    print_osc4 6 "00/87/cc"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "80/80/80"
    print_osc4 9 "cc/00/00"
    print_osc4 10 "00/96/00"
    print_osc4 11 "d0/6b/00"
    print_osc4 12 "00/00/cc"
    print_osc4 13 "cc/00/cc"
    print_osc4 14 "00/87/cc"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "3b/23/22"
    print_osc_rgb 11 "df/db/c3"
    print_osc_rgb 12 "3b/23/22"
    print_osc_rgb 17 "3b/23/22"
    print_osc_rgb 19 "df/db/c3"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cc0000"
    print_linux 2 "#009600"
    print_linux 3 "#d06b00"
    print_linux 4 "#0000cc"
    print_linux 5 "#cc00cc"
    print_linux 6 "#0087cc"
    print_linux 7 "#3b2322"
    print_linux 8 "#808080"
    print_linux 9 "#cc0000"
    print_linux 10 "#009600"
    print_linux 11 "#d06b00"
    print_linux 12 "#0000cc"
    print_linux 13 "#cc00cc"
    print_linux 14 "#0087cc"
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
