#!/usr/bin/env bash

# Source:   iterm
# Theme:    Solarized Darcula
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
    print_osc4 0 "25/29/2a"
    print_osc4 1 "f2/48/40"
    print_osc4 2 "62/96/55"
    print_osc4 3 "b6/88/00"
    print_osc4 4 "20/75/c7"
    print_osc4 5 "79/7f/d4"
    print_osc4 6 "15/96/8d"
    print_osc4 7 "d2/d8/d9"
    print_osc4 8 "25/29/2a"
    print_osc4 9 "f2/48/40"
    print_osc4 10 "62/96/55"
    print_osc4 11 "b6/88/00"
    print_osc4 12 "20/75/c7"
    print_osc4 13 "79/7f/d4"
    print_osc4 14 "15/96/8d"
    print_osc4 15 "d2/d8/d9"

    print_osc_rgb 10 "d2/d8/d9"
    print_osc_rgb 11 "3d/3f/41"
    print_osc_rgb 12 "70/81/83"
    print_osc_rgb 17 "21/42/83"
    print_osc_rgb 19 "d2/d8/d9"
}

do_linux() {
    print_linux 0 "#25292a"
    print_linux 1 "#f24840"
    print_linux 2 "#629655"
    print_linux 3 "#b68800"
    print_linux 4 "#2075c7"
    print_linux 5 "#797fd4"
    print_linux 6 "#15968d"
    print_linux 7 "#d2d8d9"
    print_linux 8 "#25292a"
    print_linux 9 "#f24840"
    print_linux 10 "#629655"
    print_linux 11 "#b68800"
    print_linux 12 "#2075c7"
    print_linux 13 "#797fd4"
    print_linux 14 "#15968d"
    print_linux 15 "#d2d8d9"
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
