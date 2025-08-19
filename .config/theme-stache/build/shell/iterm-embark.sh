#!/usr/bin/env bash

# Source:   iterm
# Theme:    Embark
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
    print_osc4 0 "1e/1c/31"
    print_osc4 1 "f0/71/9b"
    print_osc4 2 "a1/ef/d3"
    print_osc4 3 "ff/e9/aa"
    print_osc4 4 "57/c7/ff"
    print_osc4 5 "c7/92/ea"
    print_osc4 6 "87/df/eb"
    print_osc4 7 "f8/f8/f2"
    print_osc4 8 "58/52/73"
    print_osc4 9 "f0/2e/6e"
    print_osc4 10 "2c/e5/92"
    print_osc4 11 "ff/b3/78"
    print_osc4 12 "1d/a0/e2"
    print_osc4 13 "a7/42/ea"
    print_osc4 14 "63/f2/f1"
    print_osc4 15 "a6/b3/cc"

    print_osc_rgb 10 "ee/ff/ff"
    print_osc_rgb 11 "1e/1c/31"
    print_osc_rgb 12 "a1/ef/d3"
    print_osc_rgb 17 "fb/fc/fc"
    print_osc_rgb 19 "1e/1c/31"
}

do_linux() {
    print_linux 0 "#1e1c31"
    print_linux 1 "#f0719b"
    print_linux 2 "#a1efd3"
    print_linux 3 "#ffe9aa"
    print_linux 4 "#57c7ff"
    print_linux 5 "#c792ea"
    print_linux 6 "#87dfeb"
    print_linux 7 "#eeffff"
    print_linux 8 "#585273"
    print_linux 9 "#f02e6e"
    print_linux 10 "#2ce592"
    print_linux 11 "#ffb378"
    print_linux 12 "#1da0e2"
    print_linux 13 "#a742ea"
    print_linux 14 "#63f2f1"
    print_linux 15 "#a6b3cc"
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
