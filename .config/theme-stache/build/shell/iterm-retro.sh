#!/usr/bin/env bash

# Source:   iterm
# Theme:    Retro
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
    print_osc4 0 "13/a1/0e"
    print_osc4 1 "13/a1/0e"
    print_osc4 2 "13/a1/0e"
    print_osc4 3 "13/a1/0e"
    print_osc4 4 "13/a1/0e"
    print_osc4 5 "13/a1/0e"
    print_osc4 6 "13/a1/0e"
    print_osc4 7 "13/a1/0e"
    print_osc4 8 "16/ba/10"
    print_osc4 9 "16/ba/10"
    print_osc4 10 "16/ba/10"
    print_osc4 11 "16/ba/10"
    print_osc4 12 "16/ba/10"
    print_osc4 13 "16/ba/10"
    print_osc4 14 "16/ba/10"
    print_osc4 15 "16/ba/10"

    print_osc_rgb 10 "13/a1/0e"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "13/a1/0e"
    print_osc_rgb 17 "ff/fe/fe"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#13a10e"
    print_linux 1 "#13a10e"
    print_linux 2 "#13a10e"
    print_linux 3 "#13a10e"
    print_linux 4 "#13a10e"
    print_linux 5 "#13a10e"
    print_linux 6 "#13a10e"
    print_linux 7 "#13a10e"
    print_linux 8 "#16ba10"
    print_linux 9 "#16ba10"
    print_linux 10 "#16ba10"
    print_linux 11 "#16ba10"
    print_linux 12 "#16ba10"
    print_linux 13 "#16ba10"
    print_linux 14 "#16ba10"
    print_linux 15 "#16ba10"
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
