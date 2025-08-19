#!/usr/bin/env bash

# Source:   iterm
# Theme:    rose-pine-dawn
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "f2/e9/e1"
    print_osc4 1 "b4/63/7a"
    print_osc4 2 "28/69/83"
    print_osc4 3 "ea/9d/34"
    print_osc4 4 "56/94/9f"
    print_osc4 5 "90/7a/a9"
    print_osc4 6 "d7/82/7e"
    print_osc4 7 "57/52/79"
    print_osc4 8 "98/93/a5"
    print_osc4 9 "b4/63/7a"
    print_osc4 10 "28/69/83"
    print_osc4 11 "ea/9d/34"
    print_osc4 12 "56/94/9f"
    print_osc4 13 "90/7a/a9"
    print_osc4 14 "d7/82/7e"
    print_osc4 15 "57/52/79"

    print_osc_rgb 10 "57/52/79"
    print_osc_rgb 11 "fa/f4/ed"
    print_osc_rgb 12 "57/52/79"
    print_osc_rgb 17 "df/da/d9"
    print_osc_rgb 19 "57/52/79"
}

do_linux() {
    print_linux 0 "#f2e9e1"
    print_linux 1 "#b4637a"
    print_linux 2 "#286983"
    print_linux 3 "#ea9d34"
    print_linux 4 "#56949f"
    print_linux 5 "#907aa9"
    print_linux 6 "#d7827e"
    print_linux 7 "#575279"
    print_linux 8 "#9893a5"
    print_linux 9 "#b4637a"
    print_linux 10 "#286983"
    print_linux 11 "#ea9d34"
    print_linux 12 "#56949f"
    print_linux 13 "#907aa9"
    print_linux 14 "#d7827e"
    print_linux 15 "#575279"
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
