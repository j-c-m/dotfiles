#!/usr/bin/env bash

# Source:   base16
# Theme:    Zenbones
# Author:   mcchrish
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
    print_osc4 0 "19/19/19"
    print_osc4 1 "3d/38/39"
    print_osc4 2 "d6/8c/67"
    print_osc4 3 "8b/ae/68"
    print_osc4 4 "cf/86/c1"
    print_osc4 5 "65/b8/c1"
    print_osc4 6 "61/ab/da"
    print_osc4 7 "b2/79/a7"
    print_osc4 8 "b7/7e/64"
    print_osc4 9 "3d/38/39"
    print_osc4 10 "d6/8c/67"
    print_osc4 11 "8b/ae/68"
    print_osc4 12 "cf/86/c1"
    print_osc4 13 "65/b8/c1"
    print_osc4 14 "61/ab/da"
    print_osc4 15 "bb/bb/bb"

    print_osc_rgb 10 "b2/79/a7"
    print_osc_rgb 11 "19/19/19"
    print_osc_rgb 12 "b2/79/a7"
    print_osc_rgb 17 "66/a5/ad"
    print_osc_rgb 19 "de/6e/7c"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#3d3839"
    print_linux 2 "#d68c67"
    print_linux 3 "#8bae68"
    print_linux 4 "#cf86c1"
    print_linux 5 "#65b8c1"
    print_linux 6 "#61abda"
    print_linux 7 "#b279a7"
    print_linux 8 "#b77e64"
    print_linux 9 "#3d3839"
    print_linux 10 "#d68c67"
    print_linux 11 "#8bae68"
    print_linux 12 "#cf86c1"
    print_linux 13 "#65b8c1"
    print_linux 14 "#61abda"
    print_linux 15 "#bbbbbb"
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
