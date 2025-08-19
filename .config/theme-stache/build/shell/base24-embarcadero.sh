#!/usr/bin/env bash

# Source:   base24
# Theme:    Embarcadero
# Author:   Thomas Leon Highbaugh
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
    print_osc4 0 "25/2a/2f"
    print_osc4 1 "ed/5d/86"
    print_osc4 2 "20/c2/90"
    print_osc4 3 "eb/82/4d"
    print_osc4 4 "40/80/d0"
    print_osc4 5 "a0/70/d0"
    print_osc4 6 "02/ef/ef"
    print_osc4 7 "bc/bd/c0"
    print_osc4 8 "7f/82/85"
    print_osc4 9 "f5/7d/9a"
    print_osc4 10 "a0/d0/a0"
    print_osc4 11 "ff/e0/89"
    print_osc4 12 "80/b0/f0"
    print_osc4 13 "c0/90/f0"
    print_osc4 14 "40/c0/c0"
    print_osc4 15 "f8/f8/f8"

    print_osc_rgb 10 "bc/bd/c0"
    print_osc_rgb 11 "25/2a/2f"
    print_osc_rgb 12 "bc/bd/c0"
    print_osc_rgb 17 "da/db/db"
    print_osc_rgb 19 "43/47/4c"
}

do_linux() {
    print_linux 0 "#252a2f"
    print_linux 1 "#ed5d86"
    print_linux 2 "#20c290"
    print_linux 3 "#eb824d"
    print_linux 4 "#4080d0"
    print_linux 5 "#a070d0"
    print_linux 6 "#02efef"
    print_linux 7 "#bcbdc0"
    print_linux 8 "#7f8285"
    print_linux 9 "#f57d9a"
    print_linux 10 "#a0d0a0"
    print_linux 11 "#ffe089"
    print_linux 12 "#80b0f0"
    print_linux 13 "#c090f0"
    print_linux 14 "#40c0c0"
    print_linux 15 "#f8f8f8"
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
