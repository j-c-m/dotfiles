#!/usr/bin/env bash

# Source:   gogh
# Theme:    Mono Green
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
    print_osc4 0 "03/40/00"
    print_osc4 1 "0b/ff/00"
    print_osc4 2 "0b/ff/00"
    print_osc4 3 "0b/ff/00"
    print_osc4 4 "0b/ff/00"
    print_osc4 5 "0b/ff/00"
    print_osc4 6 "0b/ff/00"
    print_osc4 7 "0b/ff/00"
    print_osc4 8 "0b/ff/00"
    print_osc4 9 "0b/ff/00"
    print_osc4 10 "0b/ff/00"
    print_osc4 11 "0b/ff/00"
    print_osc4 12 "0b/ff/00"
    print_osc4 13 "0b/ff/00"
    print_osc4 14 "0b/ff/00"
    print_osc4 15 "0b/ff/00"

    print_osc_rgb 10 "0b/ff/00"
    print_osc_rgb 11 "02/2b/00"
    print_osc_rgb 12 "0b/ff/00"
    print_osc_rgb 17 "0b/ff/00"
    print_osc_rgb 19 "02/2b/00"
}

do_linux() {
    print_linux 0 "#034000"
    print_linux 1 "#0bff00"
    print_linux 2 "#0bff00"
    print_linux 3 "#0bff00"
    print_linux 4 "#0bff00"
    print_linux 5 "#0bff00"
    print_linux 6 "#0bff00"
    print_linux 7 "#0bff00"
    print_linux 8 "#0bff00"
    print_linux 9 "#0bff00"
    print_linux 10 "#0bff00"
    print_linux 11 "#0bff00"
    print_linux 12 "#0bff00"
    print_linux 13 "#0bff00"
    print_linux 14 "#0bff00"
    print_linux 15 "#0bff00"
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
