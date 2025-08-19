#!/usr/bin/env bash

# Source:   base16
# Theme:    Cupertino
# Author:   Defman21
# Variant:  light

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
    print_osc4 0 "ff/ff/ff"
    print_osc4 1 "c4/1a/15"
    print_osc4 2 "00/74/00"
    print_osc4 3 "82/6b/28"
    print_osc4 4 "00/00/ff"
    print_osc4 5 "a9/0d/91"
    print_osc4 6 "31/84/95"
    print_osc4 7 "40/40/40"
    print_osc4 8 "80/80/80"
    print_osc4 9 "c4/1a/15"
    print_osc4 10 "00/74/00"
    print_osc4 11 "82/6b/28"
    print_osc4 12 "00/00/ff"
    print_osc4 13 "a9/0d/91"
    print_osc4 14 "31/84/95"
    print_osc4 15 "5e/5e/5e"

    print_osc_rgb 10 "40/40/40"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "40/40/40"
    print_osc_rgb 17 "40/40/40"
    print_osc_rgb 19 "c0/c0/c0"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#c41a15"
    print_linux 2 "#007400"
    print_linux 3 "#826b28"
    print_linux 4 "#0000ff"
    print_linux 5 "#a90d91"
    print_linux 6 "#318495"
    print_linux 7 "#404040"
    print_linux 8 "#808080"
    print_linux 9 "#c41a15"
    print_linux 10 "#007400"
    print_linux 11 "#826b28"
    print_linux 12 "#0000ff"
    print_linux 13 "#a90d91"
    print_linux 14 "#318495"
    print_linux 15 "#5e5e5e"
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
