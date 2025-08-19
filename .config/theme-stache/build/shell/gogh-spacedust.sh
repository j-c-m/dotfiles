#!/usr/bin/env bash

# Source:   gogh
# Theme:    Spacedust
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
    print_osc4 0 "6e/53/46"
    print_osc4 1 "e3/5b/00"
    print_osc4 2 "5c/ab/96"
    print_osc4 3 "e3/cd/7b"
    print_osc4 4 "0f/54/8b"
    print_osc4 5 "e3/5b/00"
    print_osc4 6 "06/af/c7"
    print_osc4 7 "f0/f1/ce"
    print_osc4 8 "68/4c/31"
    print_osc4 9 "ff/8a/3a"
    print_osc4 10 "ae/ca/b8"
    print_osc4 11 "ff/c8/78"
    print_osc4 12 "67/a0/ce"
    print_osc4 13 "ff/8a/3a"
    print_osc4 14 "83/a7/b4"
    print_osc4 15 "fe/ff/f1"

    print_osc_rgb 10 "ec/f0/c1"
    print_osc_rgb 11 "0a/1e/24"
    print_osc_rgb 12 "ec/f0/c1"
    print_osc_rgb 17 "ec/f0/c1"
    print_osc_rgb 19 "0a/1e/24"
}

do_linux() {
    print_linux 0 "#6e5346"
    print_linux 1 "#e35b00"
    print_linux 2 "#5cab96"
    print_linux 3 "#e3cd7b"
    print_linux 4 "#0f548b"
    print_linux 5 "#e35b00"
    print_linux 6 "#06afc7"
    print_linux 7 "#ecf0c1"
    print_linux 8 "#684c31"
    print_linux 9 "#ff8a3a"
    print_linux 10 "#aecab8"
    print_linux 11 "#ffc878"
    print_linux 12 "#67a0ce"
    print_linux 13 "#ff8a3a"
    print_linux 14 "#83a7b4"
    print_linux 15 "#fefff1"
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
