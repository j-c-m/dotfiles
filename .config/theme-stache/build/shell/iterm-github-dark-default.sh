#!/usr/bin/env bash

# Source:   iterm
# Theme:    GitHub-Dark-Default
# Author:   unknown
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
    print_osc4 0 "48/4f/58"
    print_osc4 1 "ff/7b/72"
    print_osc4 2 "3f/b9/50"
    print_osc4 3 "d2/99/22"
    print_osc4 4 "58/a6/ff"
    print_osc4 5 "bc/8c/ff"
    print_osc4 6 "39/c5/cf"
    print_osc4 7 "b1/ba/c4"
    print_osc4 8 "6e/76/81"
    print_osc4 9 "ff/a1/98"
    print_osc4 10 "56/d3/64"
    print_osc4 11 "e3/b3/41"
    print_osc4 12 "79/c0/ff"
    print_osc4 13 "d2/a8/ff"
    print_osc4 14 "56/d4/dd"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e6/ed/f3"
    print_osc_rgb 11 "0d/11/17"
    print_osc_rgb 12 "2f/81/f7"
    print_osc_rgb 17 "e6/ed/f3"
    print_osc_rgb 19 "0d/11/17"
}

do_linux() {
    print_linux 0 "#484f58"
    print_linux 1 "#ff7b72"
    print_linux 2 "#3fb950"
    print_linux 3 "#d29922"
    print_linux 4 "#58a6ff"
    print_linux 5 "#bc8cff"
    print_linux 6 "#39c5cf"
    print_linux 7 "#e6edf3"
    print_linux 8 "#6e7681"
    print_linux 9 "#ffa198"
    print_linux 10 "#56d364"
    print_linux 11 "#e3b341"
    print_linux 12 "#79c0ff"
    print_linux 13 "#d2a8ff"
    print_linux 14 "#56d4dd"
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
