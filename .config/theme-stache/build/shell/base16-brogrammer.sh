#!/usr/bin/env bash

# Source:   base16
# Theme:    Brogrammer
# Author:   Vik Ramanujam (http://github.com/piggyslasher)
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
    print_osc4 1 "d6/db/e5"
    print_osc4 2 "f3/bd/09"
    print_osc4 3 "1d/d3/61"
    print_osc4 4 "53/50/b9"
    print_osc4 5 "0f/7d/db"
    print_osc4 6 "10/81/d6"
    print_osc4 7 "4e/5a/b7"
    print_osc4 8 "ec/ba/0f"
    print_osc4 9 "d6/db/e5"
    print_osc4 10 "f3/bd/09"
    print_osc4 11 "1d/d3/61"
    print_osc4 12 "53/50/b9"
    print_osc4 13 "0f/7d/db"
    print_osc4 14 "10/81/d6"
    print_osc4 15 "d6/db/e5"

    print_osc_rgb 10 "4e/5a/b7"
    print_osc_rgb 11 "1f/1f/1f"
    print_osc_rgb 12 "4e/5a/b7"
    print_osc_rgb 17 "10/81/d6"
    print_osc_rgb 19 "f8/11/18"
}

do_linux() {
    print_linux 0 "#1f1f1f"
    print_linux 1 "#d6dbe5"
    print_linux 2 "#f3bd09"
    print_linux 3 "#1dd361"
    print_linux 4 "#5350b9"
    print_linux 5 "#0f7ddb"
    print_linux 6 "#1081d6"
    print_linux 7 "#4e5ab7"
    print_linux 8 "#ecba0f"
    print_linux 9 "#d6dbe5"
    print_linux 10 "#f3bd09"
    print_linux 11 "#1dd361"
    print_linux 12 "#5350b9"
    print_linux 13 "#0f7ddb"
    print_linux 14 "#1081d6"
    print_linux 15 "#d6dbe5"
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
