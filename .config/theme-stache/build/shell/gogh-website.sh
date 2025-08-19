#!/usr/bin/env bash

# Source:   gogh
# Theme:    Website
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
    print_osc4 0 "18/3c/44"
    print_osc4 1 "da/49/49"
    print_osc4 2 "bc/ca/15"
    print_osc4 3 "ff/b0/2e"
    print_osc4 4 "35/a6/e6"
    print_osc4 5 "d3/43/a2"
    print_osc4 6 "38/c9/95"
    print_osc4 7 "ff/e8/c1"
    print_osc4 8 "23/56/62"
    print_osc4 9 "ff/57/57"
    print_osc4 10 "ec/ff/14"
    print_osc4 11 "ff/d6/94"
    print_osc4 12 "4c/bf/ff"
    print_osc4 13 "ff/4c/c2"
    print_osc4 14 "35/ff/b6"
    print_osc4 15 "ff/d4/8f"

    print_osc_rgb 10 "d1/b8/90"
    print_osc_rgb 11 "13/2f/35"
    print_osc_rgb 12 "d1/b8/90"
    print_osc_rgb 17 "d1/b8/90"
    print_osc_rgb 19 "13/2f/35"
}

do_linux() {
    print_linux 0 "#183c44"
    print_linux 1 "#da4949"
    print_linux 2 "#bcca15"
    print_linux 3 "#ffb02e"
    print_linux 4 "#35a6e6"
    print_linux 5 "#d343a2"
    print_linux 6 "#38c995"
    print_linux 7 "#d1b890"
    print_linux 8 "#235662"
    print_linux 9 "#ff5757"
    print_linux 10 "#ecff14"
    print_linux 11 "#ffd694"
    print_linux 12 "#4cbfff"
    print_linux 13 "#ff4cc2"
    print_linux 14 "#35ffb6"
    print_linux 15 "#ffd48f"
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
