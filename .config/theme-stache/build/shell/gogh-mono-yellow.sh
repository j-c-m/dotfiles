#!/usr/bin/env bash

# Source:   gogh
# Theme:    Mono Yellow
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
    print_osc4 0 "40/35/00"
    print_osc4 1 "ff/d3/00"
    print_osc4 2 "ff/d3/00"
    print_osc4 3 "ff/d3/00"
    print_osc4 4 "ff/d3/00"
    print_osc4 5 "ff/d3/00"
    print_osc4 6 "ff/d3/00"
    print_osc4 7 "ff/d3/00"
    print_osc4 8 "ff/d3/00"
    print_osc4 9 "ff/d3/00"
    print_osc4 10 "ff/d3/00"
    print_osc4 11 "ff/d3/00"
    print_osc4 12 "ff/d3/00"
    print_osc4 13 "ff/d3/00"
    print_osc4 14 "ff/d3/00"
    print_osc4 15 "ff/d3/00"

    print_osc_rgb 10 "ff/d3/00"
    print_osc_rgb 11 "2b/24/00"
    print_osc_rgb 12 "ff/d3/00"
    print_osc_rgb 17 "ff/d3/00"
    print_osc_rgb 19 "2b/24/00"
}

do_linux() {
    print_linux 0 "#403500"
    print_linux 1 "#ffd300"
    print_linux 2 "#ffd300"
    print_linux 3 "#ffd300"
    print_linux 4 "#ffd300"
    print_linux 5 "#ffd300"
    print_linux 6 "#ffd300"
    print_linux 7 "#ffd300"
    print_linux 8 "#ffd300"
    print_linux 9 "#ffd300"
    print_linux 10 "#ffd300"
    print_linux 11 "#ffd300"
    print_linux 12 "#ffd300"
    print_linux 13 "#ffd300"
    print_linux 14 "#ffd300"
    print_linux 15 "#ffd300"
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
