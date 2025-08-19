#!/usr/bin/env bash

# Source:   iterm
# Theme:    HaX0R_R3D
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
    print_osc4 0 "1f/00/00"
    print_osc4 1 "b0/0d/0d"
    print_osc4 2 "b0/0d/0d"
    print_osc4 3 "b0/0d/0d"
    print_osc4 4 "b0/0d/0d"
    print_osc4 5 "b0/0d/0d"
    print_osc4 6 "b0/0d/0d"
    print_osc4 7 "fa/fa/fa"
    print_osc4 8 "15/00/00"
    print_osc4 9 "ff/10/10"
    print_osc4 10 "ff/10/10"
    print_osc4 11 "ff/10/10"
    print_osc4 12 "ff/10/10"
    print_osc4 13 "ff/10/10"
    print_osc4 14 "ff/10/10"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "b0/0d/0d"
    print_osc_rgb 11 "1f/00/00"
    print_osc_rgb 12 "b0/0d/0d"
    print_osc_rgb 17 "eb/c1/ff"
    print_osc_rgb 19 "fd/fd/fd"
}

do_linux() {
    print_linux 0 "#1f0000"
    print_linux 1 "#b00d0d"
    print_linux 2 "#b00d0d"
    print_linux 3 "#b00d0d"
    print_linux 4 "#b00d0d"
    print_linux 5 "#b00d0d"
    print_linux 6 "#b00d0d"
    print_linux 7 "#b00d0d"
    print_linux 8 "#150000"
    print_linux 9 "#ff1010"
    print_linux 10 "#ff1010"
    print_linux 11 "#ff1010"
    print_linux 12 "#ff1010"
    print_linux 13 "#ff1010"
    print_linux 14 "#ff1010"
    print_linux 15 "#fefefe"
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
