#!/usr/bin/env bash

# Source:   gogh
# Theme:    Cai
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "ca/27/4d"
    print_osc4 2 "4d/ca/27"
    print_osc4 3 "ca/a4/27"
    print_osc4 4 "27/4d/ca"
    print_osc4 5 "a4/27/ca"
    print_osc4 6 "27/ca/a4"
    print_osc4 7 "80/80/80"
    print_osc4 8 "80/80/80"
    print_osc4 9 "e9/8d/a3"
    print_osc4 10 "a3/e9/8d"
    print_osc4 11 "e9/d4/8d"
    print_osc4 12 "8d/a3/e9"
    print_osc4 13 "d4/8d/e9"
    print_osc4 14 "8d/e9/d4"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d9/e6/f2"
    print_osc_rgb 11 "09/11/1a"
    print_osc_rgb 12 "d9/e6/f2"
    print_osc_rgb 17 "d9/e6/f2"
    print_osc_rgb 19 "09/11/1a"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ca274d"
    print_linux 2 "#4dca27"
    print_linux 3 "#caa427"
    print_linux 4 "#274dca"
    print_linux 5 "#a427ca"
    print_linux 6 "#27caa4"
    print_linux 7 "#d9e6f2"
    print_linux 8 "#808080"
    print_linux 9 "#e98da3"
    print_linux 10 "#a3e98d"
    print_linux 11 "#e9d48d"
    print_linux 12 "#8da3e9"
    print_linux 13 "#d48de9"
    print_linux 14 "#8de9d4"
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
