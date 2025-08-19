#!/usr/bin/env bash

# Source:   base16
# Theme:    Apathy
# Author:   Jannik Siebert (https://github.com/janniks)
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
    print_osc4 0 "03/1a/16"
    print_osc4 1 "3e/96/88"
    print_osc4 2 "88/3e/96"
    print_osc4 3 "3e/4c/96"
    print_osc4 4 "96/88/3e"
    print_osc4 5 "4c/96/3e"
    print_osc4 6 "96/3e/4c"
    print_osc4 7 "81/b5/ac"
    print_osc4 8 "2b/68/5e"
    print_osc4 9 "3e/96/88"
    print_osc4 10 "88/3e/96"
    print_osc4 11 "3e/4c/96"
    print_osc4 12 "96/88/3e"
    print_osc4 13 "4c/96/3e"
    print_osc4 14 "96/3e/4c"
    print_osc4 15 "d2/e7/e4"

    print_osc_rgb 10 "81/b5/ac"
    print_osc_rgb 11 "03/1a/16"
    print_osc_rgb 12 "81/b5/ac"
    print_osc_rgb 17 "a7/ce/c8"
    print_osc_rgb 19 "0b/34/2d"
}

do_linux() {
    print_linux 0 "#031a16"
    print_linux 1 "#3e9688"
    print_linux 2 "#883e96"
    print_linux 3 "#3e4c96"
    print_linux 4 "#96883e"
    print_linux 5 "#4c963e"
    print_linux 6 "#963e4c"
    print_linux 7 "#81b5ac"
    print_linux 8 "#2b685e"
    print_linux 9 "#3e9688"
    print_linux 10 "#883e96"
    print_linux 11 "#3e4c96"
    print_linux 12 "#96883e"
    print_linux 13 "#4c963e"
    print_linux 14 "#963e4c"
    print_linux 15 "#d2e7e4"
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
