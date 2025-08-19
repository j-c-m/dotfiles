#!/usr/bin/env bash

# Source:   gogh
# Theme:    Brogrammer
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
    print_osc4 0 "1f/1f/1f"
    print_osc4 1 "f8/11/18"
    print_osc4 2 "2d/c5/5e"
    print_osc4 3 "ec/ba/0f"
    print_osc4 4 "2a/84/d2"
    print_osc4 5 "4e/5a/b7"
    print_osc4 6 "10/81/d6"
    print_osc4 7 "d6/db/e5"
    print_osc4 8 "d6/db/e5"
    print_osc4 9 "de/35/2e"
    print_osc4 10 "1d/d3/61"
    print_osc4 11 "f3/bd/09"
    print_osc4 12 "10/81/d6"
    print_osc4 13 "53/50/b9"
    print_osc4 14 "0f/7d/db"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d6/db/e5"
    print_osc_rgb 11 "13/13/13"
    print_osc_rgb 12 "d6/db/e5"
    print_osc_rgb 17 "d6/db/e5"
    print_osc_rgb 19 "13/13/13"
}

do_linux() {
    print_linux 0 "#1f1f1f"
    print_linux 1 "#f81118"
    print_linux 2 "#2dc55e"
    print_linux 3 "#ecba0f"
    print_linux 4 "#2a84d2"
    print_linux 5 "#4e5ab7"
    print_linux 6 "#1081d6"
    print_linux 7 "#d6dbe5"
    print_linux 8 "#d6dbe5"
    print_linux 9 "#de352e"
    print_linux 10 "#1dd361"
    print_linux 11 "#f3bd09"
    print_linux 12 "#1081d6"
    print_linux 13 "#5350b9"
    print_linux 14 "#0f7ddb"
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
