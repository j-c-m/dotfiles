#!/usr/bin/env bash

# Source:   gogh
# Theme:    Chameleon
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
    print_osc4 0 "2c/2c/2c"
    print_osc4 1 "cc/23/1c"
    print_osc4 2 "68/9d/69"
    print_osc4 3 "d7/99/22"
    print_osc4 4 "36/6b/71"
    print_osc4 5 "4e/51/65"
    print_osc4 6 "45/85/87"
    print_osc4 7 "c8/bb/97"
    print_osc4 8 "77/77/77"
    print_osc4 9 "cc/23/1c"
    print_osc4 10 "68/9d/69"
    print_osc4 11 "d7/99/22"
    print_osc4 12 "36/6b/71"
    print_osc4 13 "4e/51/65"
    print_osc4 14 "45/85/87"
    print_osc4 15 "c8/bb/97"

    print_osc_rgb 10 "de/de/de"
    print_osc_rgb 11 "2c/2c/2c"
    print_osc_rgb 12 "de/de/de"
    print_osc_rgb 17 "de/de/de"
    print_osc_rgb 19 "2c/2c/2c"
}

do_linux() {
    print_linux 0 "#2c2c2c"
    print_linux 1 "#cc231c"
    print_linux 2 "#689d69"
    print_linux 3 "#d79922"
    print_linux 4 "#366b71"
    print_linux 5 "#4e5165"
    print_linux 6 "#458587"
    print_linux 7 "#dedede"
    print_linux 8 "#777777"
    print_linux 9 "#cc231c"
    print_linux 10 "#689d69"
    print_linux 11 "#d79922"
    print_linux 12 "#366b71"
    print_linux 13 "#4e5165"
    print_linux 14 "#458587"
    print_linux 15 "#c8bb97"
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
