#!/usr/bin/env bash

# Source:   base16
# Theme:    Vesper
# Author:   FormalSnake (https://github.com/formalsnake)
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
    print_osc4 0 "10/10/10"
    print_osc4 1 "de/6e/6e"
    print_osc4 2 "5f/87/87"
    print_osc4 3 "ff/c7/99"
    print_osc4 4 "8e/aa/aa"
    print_osc4 5 "d6/90/94"
    print_osc4 6 "60/a5/92"
    print_osc4 7 "b7/b7/b7"
    print_osc4 8 "33/33/33"
    print_osc4 9 "de/6e/6e"
    print_osc4 10 "5f/87/87"
    print_osc4 11 "ff/c7/99"
    print_osc4 12 "8e/aa/aa"
    print_osc4 13 "d6/90/94"
    print_osc4 14 "60/a5/92"
    print_osc4 15 "d5/d5/d5"

    print_osc_rgb 10 "b7/b7/b7"
    print_osc_rgb 11 "10/10/10"
    print_osc_rgb 12 "b7/b7/b7"
    print_osc_rgb 17 "c1/c1/c1"
    print_osc_rgb 19 "23/23/23"
}

do_linux() {
    print_linux 0 "#101010"
    print_linux 1 "#de6e6e"
    print_linux 2 "#5f8787"
    print_linux 3 "#ffc799"
    print_linux 4 "#8eaaaa"
    print_linux 5 "#d69094"
    print_linux 6 "#60a592"
    print_linux 7 "#b7b7b7"
    print_linux 8 "#333333"
    print_linux 9 "#de6e6e"
    print_linux 10 "#5f8787"
    print_linux 11 "#ffc799"
    print_linux 12 "#8eaaaa"
    print_linux 13 "#d69094"
    print_linux 14 "#60a592"
    print_linux 15 "#d5d5d5"
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
