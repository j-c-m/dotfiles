#!/usr/bin/env bash

# Source:   base16
# Theme:    Github
# Author:   Tinted Theming (https://github.com/tinted-theming)
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
    print_osc4 0 "ea/ee/f2"
    print_osc4 1 "fa/45/49"
    print_osc4 2 "2d/a4/4e"
    print_osc4 3 "bf/87/00"
    print_osc4 4 "21/8b/ff"
    print_osc4 5 "a4/75/f9"
    print_osc4 6 "33/9d/9b"
    print_osc4 7 "42/4a/53"
    print_osc4 8 "8c/95/9f"
    print_osc4 9 "fa/45/49"
    print_osc4 10 "2d/a4/4e"
    print_osc4 11 "bf/87/00"
    print_osc4 12 "21/8b/ff"
    print_osc4 13 "a4/75/f9"
    print_osc4 14 "33/9d/9b"
    print_osc4 15 "1f/23/28"

    print_osc_rgb 10 "42/4a/53"
    print_osc_rgb 11 "ea/ee/f2"
    print_osc_rgb 12 "42/4a/53"
    print_osc_rgb 17 "32/38/3f"
    print_osc_rgb 19 "d0/d7/de"
}

do_linux() {
    print_linux 0 "#eaeef2"
    print_linux 1 "#fa4549"
    print_linux 2 "#2da44e"
    print_linux 3 "#bf8700"
    print_linux 4 "#218bff"
    print_linux 5 "#a475f9"
    print_linux 6 "#339d9b"
    print_linux 7 "#424a53"
    print_linux 8 "#8c959f"
    print_linux 9 "#fa4549"
    print_linux 10 "#2da44e"
    print_linux 11 "#bf8700"
    print_linux 12 "#218bff"
    print_linux 13 "#a475f9"
    print_linux 14 "#339d9b"
    print_linux 15 "#1f2328"
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
