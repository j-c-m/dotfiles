#!/usr/bin/env bash

# Source:   gogh
# Theme:    Miramare
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
    print_osc4 0 "24/20/21"
    print_osc4 1 "e6/81/83"
    print_osc4 2 "a7/c0/80"
    print_osc4 3 "d9/bb/80"
    print_osc4 4 "89/be/ba"
    print_osc4 5 "d3/a0/bc"
    print_osc4 6 "87/c0/95"
    print_osc4 7 "d8/ca/ac"
    print_osc4 8 "44/44/44"
    print_osc4 9 "e3/9b/7b"
    print_osc4 10 "a7/c0/80"
    print_osc4 11 "d9/bb/80"
    print_osc4 12 "89/be/ba"
    print_osc4 13 "d3/a0/bc"
    print_osc4 14 "87/c0/95"
    print_osc4 15 "e6/d6/ac"

    print_osc_rgb 10 "e6/d6/ac"
    print_osc_rgb 11 "2a/24/26"
    print_osc_rgb 12 "e6/d6/ac"
    print_osc_rgb 17 "e6/d6/ac"
    print_osc_rgb 19 "2a/24/26"
}

do_linux() {
    print_linux 0 "#242021"
    print_linux 1 "#e68183"
    print_linux 2 "#a7c080"
    print_linux 3 "#d9bb80"
    print_linux 4 "#89beba"
    print_linux 5 "#d3a0bc"
    print_linux 6 "#87c095"
    print_linux 7 "#e6d6ac"
    print_linux 8 "#444444"
    print_linux 9 "#e39b7b"
    print_linux 10 "#a7c080"
    print_linux 11 "#d9bb80"
    print_linux 12 "#89beba"
    print_linux 13 "#d3a0bc"
    print_linux 14 "#87c095"
    print_linux 15 "#e6d6ac"
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
