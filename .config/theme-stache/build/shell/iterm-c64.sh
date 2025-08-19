#!/usr/bin/env bash

# Source:   iterm
# Theme:    C64
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
    print_osc4 0 "09/03/00"
    print_osc4 1 "88/39/32"
    print_osc4 2 "55/a0/49"
    print_osc4 3 "bf/ce/72"
    print_osc4 4 "40/31/8d"
    print_osc4 5 "8b/3f/96"
    print_osc4 6 "67/b6/bd"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "88/39/32"
    print_osc4 10 "55/a0/49"
    print_osc4 11 "bf/ce/72"
    print_osc4 12 "40/31/8d"
    print_osc4 13 "8b/3f/96"
    print_osc4 14 "67/b6/bd"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "78/69/c4"
    print_osc_rgb 11 "40/31/8d"
    print_osc_rgb 12 "78/69/c4"
    print_osc_rgb 17 "78/69/c4"
    print_osc_rgb 19 "40/31/8d"
}

do_linux() {
    print_linux 0 "#090300"
    print_linux 1 "#883932"
    print_linux 2 "#55a049"
    print_linux 3 "#bfce72"
    print_linux 4 "#40318d"
    print_linux 5 "#8b3f96"
    print_linux 6 "#67b6bd"
    print_linux 7 "#7869c4"
    print_linux 8 "#000000"
    print_linux 9 "#883932"
    print_linux 10 "#55a049"
    print_linux 11 "#bfce72"
    print_linux 12 "#40318d"
    print_linux 13 "#8b3f96"
    print_linux 14 "#67b6bd"
    print_linux 15 "#f7f7f7"
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
