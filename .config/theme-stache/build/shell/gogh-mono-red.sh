#!/usr/bin/env bash

# Source:   gogh
# Theme:    Mono Red
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
    print_osc4 0 "40/12/00"
    print_osc4 1 "ff/36/00"
    print_osc4 2 "ff/36/00"
    print_osc4 3 "ff/36/00"
    print_osc4 4 "ff/36/00"
    print_osc4 5 "ff/36/00"
    print_osc4 6 "ff/36/00"
    print_osc4 7 "ff/36/00"
    print_osc4 8 "ff/36/00"
    print_osc4 9 "ff/36/00"
    print_osc4 10 "ff/36/00"
    print_osc4 11 "ff/36/00"
    print_osc4 12 "ff/36/00"
    print_osc4 13 "ff/36/00"
    print_osc4 14 "ff/36/00"
    print_osc4 15 "ff/36/00"

    print_osc_rgb 10 "ff/36/00"
    print_osc_rgb 11 "2b/0c/00"
    print_osc_rgb 12 "ff/36/00"
    print_osc_rgb 17 "ff/36/00"
    print_osc_rgb 19 "2b/0c/00"
}

do_linux() {
    print_linux 0 "#401200"
    print_linux 1 "#ff3600"
    print_linux 2 "#ff3600"
    print_linux 3 "#ff3600"
    print_linux 4 "#ff3600"
    print_linux 5 "#ff3600"
    print_linux 6 "#ff3600"
    print_linux 7 "#ff3600"
    print_linux 8 "#ff3600"
    print_linux 9 "#ff3600"
    print_linux 10 "#ff3600"
    print_linux 11 "#ff3600"
    print_linux 12 "#ff3600"
    print_linux 13 "#ff3600"
    print_linux 14 "#ff3600"
    print_linux 15 "#ff3600"
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
