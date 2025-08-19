#!/usr/bin/env bash

# Source:   base16
# Theme:    Spaceduck
# Author:   Guillermo Rodriguez (https://github.com/pineapplegiant), packaged by Gabriel Fontes (https://github.com/Misterio77)
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
    print_osc4 0 "16/17/2d"
    print_osc4 1 "e3/34/00"
    print_osc4 2 "5c/cc/96"
    print_osc4 3 "f2/ce/00"
    print_osc4 4 "7a/5c/cc"
    print_osc4 5 "b3/a1/e6"
    print_osc4 6 "00/a3/cc"
    print_osc4 7 "ec/f0/c1"
    print_osc4 8 "68/6f/9a"
    print_osc4 9 "e3/34/00"
    print_osc4 10 "5c/cc/96"
    print_osc4 11 "f2/ce/00"
    print_osc4 12 "7a/5c/cc"
    print_osc4 13 "b3/a1/e6"
    print_osc4 14 "00/a3/cc"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ec/f0/c1"
    print_osc_rgb 11 "16/17/2d"
    print_osc_rgb 12 "ec/f0/c1"
    print_osc_rgb 17 "c1/c3/cc"
    print_osc_rgb 19 "1b/1c/36"
}

do_linux() {
    print_linux 0 "#16172d"
    print_linux 1 "#e33400"
    print_linux 2 "#5ccc96"
    print_linux 3 "#f2ce00"
    print_linux 4 "#7a5ccc"
    print_linux 5 "#b3a1e6"
    print_linux 6 "#00a3cc"
    print_linux 7 "#ecf0c1"
    print_linux 8 "#686f9a"
    print_linux 9 "#e33400"
    print_linux 10 "#5ccc96"
    print_linux 11 "#f2ce00"
    print_linux 12 "#7a5ccc"
    print_linux 13 "#b3a1e6"
    print_linux 14 "#00a3cc"
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
