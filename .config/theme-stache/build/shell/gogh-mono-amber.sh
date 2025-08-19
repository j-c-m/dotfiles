#!/usr/bin/env bash

# Source:   gogh
# Theme:    Mono Amber
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
    print_osc4 0 "40/25/00"
    print_osc4 1 "ff/94/00"
    print_osc4 2 "ff/94/00"
    print_osc4 3 "ff/94/00"
    print_osc4 4 "ff/94/00"
    print_osc4 5 "ff/94/00"
    print_osc4 6 "ff/94/00"
    print_osc4 7 "ff/94/00"
    print_osc4 8 "ff/94/00"
    print_osc4 9 "ff/94/00"
    print_osc4 10 "ff/94/00"
    print_osc4 11 "ff/94/00"
    print_osc4 12 "ff/94/00"
    print_osc4 13 "ff/94/00"
    print_osc4 14 "ff/94/00"
    print_osc4 15 "ff/94/00"

    print_osc_rgb 10 "ff/94/00"
    print_osc_rgb 11 "2b/19/00"
    print_osc_rgb 12 "ff/94/00"
    print_osc_rgb 17 "ff/94/00"
    print_osc_rgb 19 "2b/19/00"
}

do_linux() {
    print_linux 0 "#402500"
    print_linux 1 "#ff9400"
    print_linux 2 "#ff9400"
    print_linux 3 "#ff9400"
    print_linux 4 "#ff9400"
    print_linux 5 "#ff9400"
    print_linux 6 "#ff9400"
    print_linux 7 "#ff9400"
    print_linux 8 "#ff9400"
    print_linux 9 "#ff9400"
    print_linux 10 "#ff9400"
    print_linux 11 "#ff9400"
    print_linux 12 "#ff9400"
    print_linux 13 "#ff9400"
    print_linux 14 "#ff9400"
    print_linux 15 "#ff9400"
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
