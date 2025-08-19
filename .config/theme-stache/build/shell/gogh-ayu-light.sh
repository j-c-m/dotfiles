#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ayu Light
# Author:   
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "57/5f/66"
    print_osc4 1 "f5/18/18"
    print_osc4 2 "86/b3/00"
    print_osc4 3 "f2/ae/49"
    print_osc4 4 "39/9e/e6"
    print_osc4 5 "a3/7a/cc"
    print_osc4 6 "4c/bf/99"
    print_osc4 7 "fa/fa/fa"
    print_osc4 8 "8a/91/99"
    print_osc4 9 "f5/18/18"
    print_osc4 10 "86/b3/00"
    print_osc4 11 "f2/ae/49"
    print_osc4 12 "39/9e/e6"
    print_osc4 13 "a3/7a/cc"
    print_osc4 14 "4c/bf/99"
    print_osc4 15 "fa/fa/fa"

    print_osc_rgb 10 "57/5f/66"
    print_osc_rgb 11 "fa/fa/fa"
    print_osc_rgb 12 "ff/99/40"
    print_osc_rgb 17 "57/5f/66"
    print_osc_rgb 19 "fa/fa/fa"
}

do_linux() {
    print_linux 0 "#575f66"
    print_linux 1 "#f51818"
    print_linux 2 "#86b300"
    print_linux 3 "#f2ae49"
    print_linux 4 "#399ee6"
    print_linux 5 "#a37acc"
    print_linux 6 "#4cbf99"
    print_linux 7 "#575f66"
    print_linux 8 "#8a9199"
    print_linux 9 "#f51818"
    print_linux 10 "#86b300"
    print_linux 11 "#f2ae49"
    print_linux 12 "#399ee6"
    print_linux 13 "#a37acc"
    print_linux 14 "#4cbf99"
    print_linux 15 "#fafafa"
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
