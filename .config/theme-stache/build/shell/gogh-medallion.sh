#!/usr/bin/env bash

# Source:   gogh
# Theme:    Medallion
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "b6/4c/00"
    print_osc4 2 "7c/8b/16"
    print_osc4 3 "d3/bd/26"
    print_osc4 4 "61/6b/b0"
    print_osc4 5 "8c/5a/90"
    print_osc4 6 "91/6c/25"
    print_osc4 7 "ca/c2/9a"
    print_osc4 8 "5e/52/19"
    print_osc4 9 "ff/91/49"
    print_osc4 10 "b2/ca/3b"
    print_osc4 11 "ff/e5/4a"
    print_osc4 12 "ac/b8/ff"
    print_osc4 13 "ff/a0/ff"
    print_osc4 14 "ff/bc/51"
    print_osc4 15 "fe/d6/98"

    print_osc_rgb 10 "ca/c2/96"
    print_osc_rgb 11 "1d/19/08"
    print_osc_rgb 12 "ca/c2/96"
    print_osc_rgb 17 "ca/c2/96"
    print_osc_rgb 19 "1d/19/08"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#b64c00"
    print_linux 2 "#7c8b16"
    print_linux 3 "#d3bd26"
    print_linux 4 "#616bb0"
    print_linux 5 "#8c5a90"
    print_linux 6 "#916c25"
    print_linux 7 "#cac296"
    print_linux 8 "#5e5219"
    print_linux 9 "#ff9149"
    print_linux 10 "#b2ca3b"
    print_linux 11 "#ffe54a"
    print_linux 12 "#acb8ff"
    print_linux 13 "#ffa0ff"
    print_linux 14 "#ffbc51"
    print_linux 15 "#fed698"
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
