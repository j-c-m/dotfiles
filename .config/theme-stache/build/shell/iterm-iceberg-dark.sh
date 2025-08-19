#!/usr/bin/env bash

# Source:   iterm
# Theme:    iceberg-dark
# Author:   unknown
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
    print_osc4 0 "1e/21/32"
    print_osc4 1 "e2/78/78"
    print_osc4 2 "b4/be/82"
    print_osc4 3 "e2/a4/78"
    print_osc4 4 "84/a0/c6"
    print_osc4 5 "a0/93/c7"
    print_osc4 6 "89/b8/c2"
    print_osc4 7 "c6/c8/d1"
    print_osc4 8 "6b/70/89"
    print_osc4 9 "e9/89/89"
    print_osc4 10 "c0/ca/8e"
    print_osc4 11 "e9/b1/89"
    print_osc4 12 "91/ac/d1"
    print_osc4 13 "ad/a0/d3"
    print_osc4 14 "95/c4/ce"
    print_osc4 15 "d2/d4/de"

    print_osc_rgb 10 "c6/c8/d1"
    print_osc_rgb 11 "16/18/21"
    print_osc_rgb 12 "c6/c8/d1"
    print_osc_rgb 17 "c6/c8/d1"
    print_osc_rgb 19 "16/18/21"
}

do_linux() {
    print_linux 0 "#1e2132"
    print_linux 1 "#e27878"
    print_linux 2 "#b4be82"
    print_linux 3 "#e2a478"
    print_linux 4 "#84a0c6"
    print_linux 5 "#a093c7"
    print_linux 6 "#89b8c2"
    print_linux 7 "#c6c8d1"
    print_linux 8 "#6b7089"
    print_linux 9 "#e98989"
    print_linux 10 "#c0ca8e"
    print_linux 11 "#e9b189"
    print_linux 12 "#91acd1"
    print_linux 13 "#ada0d3"
    print_linux 14 "#95c4ce"
    print_linux 15 "#d2d4de"
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
