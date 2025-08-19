#!/usr/bin/env bash

# Source:   base16
# Theme:    pandora
# Author:   Cassandra Fox
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
    print_osc4 0 "13/12/13"
    print_osc4 1 "b0/0b/69"
    print_osc4 2 "9d/df/69"
    print_osc4 3 "ff/cc/00"
    print_osc4 4 "00/80/80"
    print_osc4 5 "a2/40/30"
    print_osc4 6 "71/4c/a6"
    print_osc4 7 "f1/5c/99"
    print_osc4 8 "ff/be/e3"
    print_osc4 9 "b0/0b/69"
    print_osc4 10 "9d/df/69"
    print_osc4 11 "ff/cc/00"
    print_osc4 12 "00/80/80"
    print_osc4 13 "a2/40/30"
    print_osc4 14 "71/4c/a6"
    print_osc4 15 "63/22/27"

    print_osc_rgb 10 "f1/5c/99"
    print_osc_rgb 11 "13/12/13"
    print_osc_rgb 12 "f1/5c/99"
    print_osc_rgb 17 "81/50/6a"
    print_osc_rgb 19 "2f/18/23"
}

do_linux() {
    print_linux 0 "#131213"
    print_linux 1 "#b00b69"
    print_linux 2 "#9ddf69"
    print_linux 3 "#ffcc00"
    print_linux 4 "#008080"
    print_linux 5 "#a24030"
    print_linux 6 "#714ca6"
    print_linux 7 "#f15c99"
    print_linux 8 "#ffbee3"
    print_linux 9 "#b00b69"
    print_linux 10 "#9ddf69"
    print_linux 11 "#ffcc00"
    print_linux 12 "#008080"
    print_linux 13 "#a24030"
    print_linux 14 "#714ca6"
    print_linux 15 "#632227"
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
