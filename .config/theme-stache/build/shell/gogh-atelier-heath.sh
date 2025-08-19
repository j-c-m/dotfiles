#!/usr/bin/env bash

# Source:   gogh
# Theme:    Atelier Heath
# Author:   Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/heath)
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
    print_osc4 0 "1b/18/1b"
    print_osc4 1 "ca/40/2b"
    print_osc4 2 "91/8b/3b"
    print_osc4 3 "bb/8a/35"
    print_osc4 4 "51/6a/ec"
    print_osc4 5 "7b/59/c0"
    print_osc4 6 "15/93/93"
    print_osc4 7 "ab/9b/ab"
    print_osc4 8 "77/69/77"
    print_osc4 9 "a6/59/26"
    print_osc4 10 "91/8b/3b"
    print_osc4 11 "bb/8a/35"
    print_osc4 12 "51/6a/ec"
    print_osc4 13 "7b/59/c0"
    print_osc4 14 "15/93/93"
    print_osc4 15 "f7/f3/f7"

    print_osc_rgb 10 "9e/8f/9e"
    print_osc_rgb 11 "1b/18/1b"
    print_osc_rgb 12 "9e/8f/9e"
    print_osc_rgb 17 "9e/8f/9e"
    print_osc_rgb 19 "1b/18/1b"
}

do_linux() {
    print_linux 0 "#1b181b"
    print_linux 1 "#ca402b"
    print_linux 2 "#918b3b"
    print_linux 3 "#bb8a35"
    print_linux 4 "#516aec"
    print_linux 5 "#7b59c0"
    print_linux 6 "#159393"
    print_linux 7 "#9e8f9e"
    print_linux 8 "#776977"
    print_linux 9 "#a65926"
    print_linux 10 "#918b3b"
    print_linux 11 "#bb8a35"
    print_linux 12 "#516aec"
    print_linux 13 "#7b59c0"
    print_linux 14 "#159393"
    print_linux 15 "#f7f3f7"
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
