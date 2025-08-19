#!/usr/bin/env bash

# Source:   iterm
# Theme:    OneHalfLight
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "37/39/42"
    print_osc4 1 "e4/56/49"
    print_osc4 2 "4f/a1/4f"
    print_osc4 3 "c0/84/00"
    print_osc4 4 "00/84/bc"
    print_osc4 5 "a6/25/a4"
    print_osc4 6 "09/96/b3"
    print_osc4 7 "fa/fa/fa"
    print_osc4 8 "4f/52/5d"
    print_osc4 9 "df/6c/75"
    print_osc4 10 "98/c3/79"
    print_osc4 11 "e4/c0/7a"
    print_osc4 12 "61/af/ef"
    print_osc4 13 "c5/77/dd"
    print_osc4 14 "56/b5/c1"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "37/39/42"
    print_osc_rgb 11 "fa/fa/fa"
    print_osc_rgb 12 "be/ce/ff"
    print_osc_rgb 17 "be/ce/ff"
    print_osc_rgb 19 "37/39/42"
}

do_linux() {
    print_linux 0 "#373942"
    print_linux 1 "#e45649"
    print_linux 2 "#4fa14f"
    print_linux 3 "#c08400"
    print_linux 4 "#0084bc"
    print_linux 5 "#a625a4"
    print_linux 6 "#0996b3"
    print_linux 7 "#373942"
    print_linux 8 "#4f525d"
    print_linux 9 "#df6c75"
    print_linux 10 "#98c379"
    print_linux 11 "#e4c07a"
    print_linux 12 "#61afef"
    print_linux 13 "#c577dd"
    print_linux 14 "#56b5c1"
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
