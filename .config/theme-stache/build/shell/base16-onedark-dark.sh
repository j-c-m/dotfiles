#!/usr/bin/env bash

# Source:   base16
# Theme:    OneDark Dark
# Author:   olimorris (https://github.com/olimorris)
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ef/59/6f"
    print_osc4 2 "89/ca/78"
    print_osc4 3 "e5/c0/7b"
    print_osc4 4 "61/af/ef"
    print_osc4 5 "d5/5f/de"
    print_osc4 6 "2b/ba/c5"
    print_osc4 7 "ab/b2/bf"
    print_osc4 8 "43/48/52"
    print_osc4 9 "ef/59/6f"
    print_osc4 10 "89/ca/78"
    print_osc4 11 "e5/c0/7b"
    print_osc4 12 "61/af/ef"
    print_osc4 13 "d5/5f/de"
    print_osc4 14 "2b/ba/c5"
    print_osc4 15 "c8/cc/d4"

    print_osc_rgb 10 "ab/b2/bf"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ab/b2/bf"
    print_osc_rgb 17 "b6/bd/ca"
    print_osc_rgb 19 "1c/1f/24"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ef596f"
    print_linux 2 "#89ca78"
    print_linux 3 "#e5c07b"
    print_linux 4 "#61afef"
    print_linux 5 "#d55fde"
    print_linux 6 "#2bbac5"
    print_linux 7 "#abb2bf"
    print_linux 8 "#434852"
    print_linux 9 "#ef596f"
    print_linux 10 "#89ca78"
    print_linux 11 "#e5c07b"
    print_linux 12 "#61afef"
    print_linux 13 "#d55fde"
    print_linux 14 "#2bbac5"
    print_linux 15 "#c8ccd4"
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
