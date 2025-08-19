#!/usr/bin/env bash

# Source:   iterm
# Theme:    Medallion
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "b5/4c/00"
    print_osc4 2 "7c/8a/16"
    print_osc4 3 "d2/bd/25"
    print_osc4 4 "60/6b/af"
    print_osc4 5 "8b/59/90"
    print_osc4 6 "90/6b/25"
    print_osc4 7 "c9/c1/99"
    print_osc4 8 "5e/51/18"
    print_osc4 9 "ff/91/48"
    print_osc4 10 "b1/c9/3a"
    print_osc4 11 "ff/e4/49"
    print_osc4 12 "ab/b8/ff"
    print_osc4 13 "fe/9f/ff"
    print_osc4 14 "ff/bb/51"
    print_osc4 15 "fe/d5/97"

    print_osc_rgb 10 "ca/c2/96"
    print_osc_rgb 11 "1d/18/08"
    print_osc_rgb 12 "d3/b9/2f"
    print_osc_rgb 17 "61/6c/ab"
    print_osc_rgb 19 "c9/c1/99"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#b54c00"
    print_linux 2 "#7c8a16"
    print_linux 3 "#d2bd25"
    print_linux 4 "#606baf"
    print_linux 5 "#8b5990"
    print_linux 6 "#906b25"
    print_linux 7 "#cac296"
    print_linux 8 "#5e5118"
    print_linux 9 "#ff9148"
    print_linux 10 "#b1c93a"
    print_linux 11 "#ffe449"
    print_linux 12 "#abb8ff"
    print_linux 13 "#fe9fff"
    print_linux 14 "#ffbb51"
    print_linux 15 "#fed597"
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
