#!/usr/bin/env bash

# Source:   gogh
# Theme:    Dehydration
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "33/33/33"
    print_osc4 1 "ff/55/55"
    print_osc4 2 "5f/d3/8d"
    print_osc4 3 "ff/99/55"
    print_osc4 4 "37/71/c8"
    print_osc4 5 "bc/5f/d3"
    print_osc4 6 "5f/d3/bc"
    print_osc4 7 "99/99/99"
    print_osc4 8 "66/66/66"
    print_osc4 9 "ff/80/80"
    print_osc4 10 "87/de/aa"
    print_osc4 11 "ff/b3/80"
    print_osc4 12 "5f/8d/d3"
    print_osc4 13 "cd/87/de"
    print_osc4 14 "87/de/cd"
    print_osc4 15 "cc/cc/cc"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "33/33/33"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "cc/cc/cc"
    print_osc_rgb 19 "33/33/33"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#ff5555"
    print_linux 2 "#5fd38d"
    print_linux 3 "#ff9955"
    print_linux 4 "#3771c8"
    print_linux 5 "#bc5fd3"
    print_linux 6 "#5fd3bc"
    print_linux 7 "#cccccc"
    print_linux 8 "#666666"
    print_linux 9 "#ff8080"
    print_linux 10 "#87deaa"
    print_linux 11 "#ffb380"
    print_linux 12 "#5f8dd3"
    print_linux 13 "#cd87de"
    print_linux 14 "#87decd"
    print_linux 15 "#cccccc"
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
