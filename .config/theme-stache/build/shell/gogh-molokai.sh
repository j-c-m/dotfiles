#!/usr/bin/env bash

# Source:   gogh
# Theme:    Molokai
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "1b/1d/1e"
    print_osc4 1 "73/25/fa"
    print_osc4 2 "23/e2/98"
    print_osc4 3 "60/d4/df"
    print_osc4 4 "d0/80/10"
    print_osc4 5 "ff/00/87"
    print_osc4 6 "d0/a8/43"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "55/55/55"
    print_osc4 9 "9d/66/f6"
    print_osc4 10 "5f/e0/b1"
    print_osc4 11 "6d/f2/ff"
    print_osc4 12 "ff/af/00"
    print_osc4 13 "ff/87/af"
    print_osc4 14 "ff/ce/51"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bb/bb/bb"
    print_osc_rgb 11 "1b/1d/1e"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "bb/bb/bb"
    print_osc_rgb 19 "1b/1d/1e"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#7325fa"
    print_linux 2 "#23e298"
    print_linux 3 "#60d4df"
    print_linux 4 "#d08010"
    print_linux 5 "#ff0087"
    print_linux 6 "#d0a843"
    print_linux 7 "#bbbbbb"
    print_linux 8 "#555555"
    print_linux 9 "#9d66f6"
    print_linux 10 "#5fe0b1"
    print_linux 11 "#6df2ff"
    print_linux 12 "#ffaf00"
    print_linux 13 "#ff87af"
    print_linux 14 "#ffce51"
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
