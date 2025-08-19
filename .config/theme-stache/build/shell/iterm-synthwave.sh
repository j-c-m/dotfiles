#!/usr/bin/env bash

# Source:   iterm
# Theme:    synthwave
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "f6/18/8f"
    print_osc4 2 "1e/bb/2b"
    print_osc4 3 "fd/f8/34"
    print_osc4 4 "21/86/ec"
    print_osc4 5 "f8/5a/21"
    print_osc4 6 "12/c3/e2"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "f8/41/a0"
    print_osc4 10 "25/c1/41"
    print_osc4 11 "fd/f4/54"
    print_osc4 12 "2f/9d/ed"
    print_osc4 13 "f9/71/37"
    print_osc4 14 "19/cd/e6"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "da/d9/c7"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "19/cd/e6"
    print_osc_rgb 17 "19/cd/e6"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f6188f"
    print_linux 2 "#1ebb2b"
    print_linux 3 "#fdf834"
    print_linux 4 "#2186ec"
    print_linux 5 "#f85a21"
    print_linux 6 "#12c3e2"
    print_linux 7 "#dad9c7"
    print_linux 8 "#000000"
    print_linux 9 "#f841a0"
    print_linux 10 "#25c141"
    print_linux 11 "#fdf454"
    print_linux 12 "#2f9ded"
    print_linux 13 "#f97137"
    print_linux 14 "#19cde6"
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
