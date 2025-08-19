#!/usr/bin/env bash

# Source:   base16
# Theme:    Helios
# Author:   Alex Meyer (https://github.com/reyemxela)
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
    print_osc4 0 "1d/20/21"
    print_osc4 1 "d7/26/38"
    print_osc4 2 "88/b9/2d"
    print_osc4 3 "f1/9d/1a"
    print_osc4 4 "1e/8b/ac"
    print_osc4 5 "be/42/64"
    print_osc4 6 "1b/a5/95"
    print_osc4 7 "d5/d5/d5"
    print_osc4 8 "6f/75/79"
    print_osc4 9 "d7/26/38"
    print_osc4 10 "88/b9/2d"
    print_osc4 11 "f1/9d/1a"
    print_osc4 12 "1e/8b/ac"
    print_osc4 13 "be/42/64"
    print_osc4 14 "1b/a5/95"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "d5/d5/d5"
    print_osc_rgb 11 "1d/20/21"
    print_osc_rgb 12 "d5/d5/d5"
    print_osc_rgb 17 "dd/dd/dd"
    print_osc_rgb 19 "38/3c/3e"
}

do_linux() {
    print_linux 0 "#1d2021"
    print_linux 1 "#d72638"
    print_linux 2 "#88b92d"
    print_linux 3 "#f19d1a"
    print_linux 4 "#1e8bac"
    print_linux 5 "#be4264"
    print_linux 6 "#1ba595"
    print_linux 7 "#d5d5d5"
    print_linux 8 "#6f7579"
    print_linux 9 "#d72638"
    print_linux 10 "#88b92d"
    print_linux 11 "#f19d1a"
    print_linux 12 "#1e8bac"
    print_linux 13 "#be4264"
    print_linux 14 "#1ba595"
    print_linux 15 "#e5e5e5"
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
