#!/usr/bin/env bash

# Source:   base24
# Theme:    Mission Brogue
# Author:   Thomas Leon Highbaugh
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
    print_osc4 0 "28/31/39"
    print_osc4 1 "ef/a9/a9"
    print_osc4 2 "8c/d4/b0"
    print_osc4 3 "e0/b8/8a"
    print_osc4 4 "a2/c5/fd"
    print_osc4 5 "cc/b7/db"
    print_osc4 6 "93/df/ec"
    print_osc4 7 "93/a5/b4"
    print_osc4 8 "60/77/8a"
    print_osc4 9 "f6/bf/bf"
    print_osc4 10 "b5/e0/90"
    print_osc4 11 "ff/f0/b2"
    print_osc4 12 "c3/d9/fd"
    print_osc4 13 "e3/c3/e6"
    print_osc4 14 "b2/f0/fd"
    print_osc4 15 "e7/eb/ee"

    print_osc_rgb 10 "93/a5/b4"
    print_osc_rgb 11 "28/31/39"
    print_osc_rgb 12 "93/a5/b4"
    print_osc_rgb 17 "ab/b9/c4"
    print_osc_rgb 19 "3b/49/54"
}

do_linux() {
    print_linux 0 "#283139"
    print_linux 1 "#efa9a9"
    print_linux 2 "#8cd4b0"
    print_linux 3 "#e0b88a"
    print_linux 4 "#a2c5fd"
    print_linux 5 "#ccb7db"
    print_linux 6 "#93dfec"
    print_linux 7 "#93a5b4"
    print_linux 8 "#60778a"
    print_linux 9 "#f6bfbf"
    print_linux 10 "#b5e090"
    print_linux 11 "#fff0b2"
    print_linux 12 "#c3d9fd"
    print_linux 13 "#e3c3e6"
    print_linux 14 "#b2f0fd"
    print_linux 15 "#e7ebee"
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
