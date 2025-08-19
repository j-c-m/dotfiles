#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Field
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
    print_osc4 0 "18/20/1e"
    print_osc4 1 "0f/bd/a0"
    print_osc4 2 "3b/e3/81"
    print_osc4 3 "85/ff/b8"
    print_osc4 4 "25/d0/b4"
    print_osc4 5 "3b/e3/81"
    print_osc4 6 "40/dd/c3"
    print_osc4 7 "8e/a4/a0"
    print_osc4 8 "5a/6d/6a"
    print_osc4 9 "55/ec/94"
    print_osc4 10 "24/2e/2c"
    print_osc4 11 "42/52/4f"
    print_osc4 12 "66/7a/77"
    print_osc4 13 "88/f2/e0"
    print_osc4 14 "25/d4/6e"
    print_osc4 15 "a8/ff/f1"

    print_osc_rgb 10 "8e/a4/a0"
    print_osc_rgb 11 "18/20/1e"
    print_osc_rgb 12 "00/94/3e"
    print_osc_rgb 17 "8e/a4/a0"
    print_osc_rgb 19 "18/20/1e"
}

do_linux() {
    print_linux 0 "#18201e"
    print_linux 1 "#0fbda0"
    print_linux 2 "#3be381"
    print_linux 3 "#85ffb8"
    print_linux 4 "#25d0b4"
    print_linux 5 "#3be381"
    print_linux 6 "#40ddc3"
    print_linux 7 "#8ea4a0"
    print_linux 8 "#5a6d6a"
    print_linux 9 "#55ec94"
    print_linux 10 "#242e2c"
    print_linux 11 "#42524f"
    print_linux 12 "#667a77"
    print_linux 13 "#88f2e0"
    print_linux 14 "#25d46e"
    print_linux 15 "#a8fff1"
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
