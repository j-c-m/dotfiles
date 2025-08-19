#!/usr/bin/env bash

# Source:   gogh
# Theme:    Cobalt 2
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
    print_osc4 1 "ff/00/00"
    print_osc4 2 "38/de/21"
    print_osc4 3 "ff/e5/0a"
    print_osc4 4 "14/60/d2"
    print_osc4 5 "ff/00/5d"
    print_osc4 6 "00/bb/bb"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "55/55/55"
    print_osc4 9 "f4/0e/17"
    print_osc4 10 "3b/d0/1d"
    print_osc4 11 "ed/c8/09"
    print_osc4 12 "55/55/ff"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "6a/e3/fa"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "13/27/38"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "13/27/38"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff0000"
    print_linux 2 "#38de21"
    print_linux 3 "#ffe50a"
    print_linux 4 "#1460d2"
    print_linux 5 "#ff005d"
    print_linux 6 "#00bbbb"
    print_linux 7 "#ffffff"
    print_linux 8 "#555555"
    print_linux 9 "#f40e17"
    print_linux 10 "#3bd01d"
    print_linux 11 "#edc809"
    print_linux 12 "#5555ff"
    print_linux 13 "#ff55ff"
    print_linux 14 "#6ae3fa"
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
