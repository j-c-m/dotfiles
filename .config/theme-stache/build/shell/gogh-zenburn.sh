#!/usr/bin/env bash

# Source:   gogh
# Theme:    Zenburn
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
    print_osc4 0 "33/33/33"
    print_osc4 1 "cc/93/93"
    print_osc4 2 "ef/ef/87"
    print_osc4 3 "ff/d7/a7"
    print_osc4 4 "c3/bf/97"
    print_osc4 5 "bc/a3/a3"
    print_osc4 6 "93/b3/a3"
    print_osc4 7 "f0/ef/d0"
    print_osc4 8 "75/75/75"
    print_osc4 9 "df/af/87"
    print_osc4 10 "ff/ff/87"
    print_osc4 11 "ff/cf/af"
    print_osc4 12 "d7/d7/af"
    print_osc4 13 "d7/af/af"
    print_osc4 14 "93/be/a3"
    print_osc4 15 "dc/dc/cc"

    print_osc_rgb 10 "dc/dc/cc"
    print_osc_rgb 11 "3a/3a/3a"
    print_osc_rgb 12 "dc/dc/cc"
    print_osc_rgb 17 "dc/dc/cc"
    print_osc_rgb 19 "3a/3a/3a"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#cc9393"
    print_linux 2 "#efef87"
    print_linux 3 "#ffd7a7"
    print_linux 4 "#c3bf97"
    print_linux 5 "#bca3a3"
    print_linux 6 "#93b3a3"
    print_linux 7 "#dcdccc"
    print_linux 8 "#757575"
    print_linux 9 "#dfaf87"
    print_linux 10 "#ffff87"
    print_linux 11 "#ffcfaf"
    print_linux 12 "#d7d7af"
    print_linux 13 "#d7afaf"
    print_linux 14 "#93bea3"
    print_linux 15 "#dcdccc"
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
