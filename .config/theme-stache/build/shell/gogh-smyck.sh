#!/usr/bin/env bash

# Source:   gogh
# Theme:    Smyck
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "c7/56/46"
    print_osc4 2 "8e/b3/3b"
    print_osc4 3 "d0/b0/3c"
    print_osc4 4 "72/b3/cc"
    print_osc4 5 "c8/a0/d1"
    print_osc4 6 "21/86/93"
    print_osc4 7 "b0/b0/b0"
    print_osc4 8 "5d/5d/5d"
    print_osc4 9 "e0/96/90"
    print_osc4 10 "cd/ee/69"
    print_osc4 11 "ff/e3/77"
    print_osc4 12 "9c/d9/f0"
    print_osc4 13 "fb/b1/f9"
    print_osc4 14 "77/df/d8"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "f7/f7/f7"
    print_osc_rgb 11 "24/24/24"
    print_osc_rgb 12 "f7/f7/f7"
    print_osc_rgb 17 "f7/f7/f7"
    print_osc_rgb 19 "24/24/24"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c75646"
    print_linux 2 "#8eb33b"
    print_linux 3 "#d0b03c"
    print_linux 4 "#72b3cc"
    print_linux 5 "#c8a0d1"
    print_linux 6 "#218693"
    print_linux 7 "#f7f7f7"
    print_linux 8 "#5d5d5d"
    print_linux 9 "#e09690"
    print_linux 10 "#cdee69"
    print_linux 11 "#ffe377"
    print_linux 12 "#9cd9f0"
    print_linux 13 "#fbb1f9"
    print_linux 14 "#77dfd8"
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
