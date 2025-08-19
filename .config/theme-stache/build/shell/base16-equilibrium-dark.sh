#!/usr/bin/env bash

# Source:   base16
# Theme:    Equilibrium Dark
# Author:   Carlo Abelli
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
    print_osc4 0 "0c/11/18"
    print_osc4 1 "f0/43/39"
    print_osc4 2 "7f/8b/00"
    print_osc4 3 "bb/88/01"
    print_osc4 4 "00/8d/d1"
    print_osc4 5 "6a/7f/d2"
    print_osc4 6 "00/94/8b"
    print_osc4 7 "af/ab/a2"
    print_osc4 8 "7b/77/6e"
    print_osc4 9 "f0/43/39"
    print_osc4 10 "7f/8b/00"
    print_osc4 11 "bb/88/01"
    print_osc4 12 "00/8d/d1"
    print_osc4 13 "6a/7f/d2"
    print_osc4 14 "00/94/8b"
    print_osc4 15 "e7/e2/d9"

    print_osc_rgb 10 "af/ab/a2"
    print_osc_rgb 11 "0c/11/18"
    print_osc_rgb 12 "af/ab/a2"
    print_osc_rgb 17 "ca/c6/bd"
    print_osc_rgb 19 "18/1c/22"
}

do_linux() {
    print_linux 0 "#0c1118"
    print_linux 1 "#f04339"
    print_linux 2 "#7f8b00"
    print_linux 3 "#bb8801"
    print_linux 4 "#008dd1"
    print_linux 5 "#6a7fd2"
    print_linux 6 "#00948b"
    print_linux 7 "#afaba2"
    print_linux 8 "#7b776e"
    print_linux 9 "#f04339"
    print_linux 10 "#7f8b00"
    print_linux 11 "#bb8801"
    print_linux 12 "#008dd1"
    print_linux 13 "#6a7fd2"
    print_linux 14 "#00948b"
    print_linux 15 "#e7e2d9"
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
