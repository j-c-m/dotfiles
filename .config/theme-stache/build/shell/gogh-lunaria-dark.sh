#!/usr/bin/env bash

# Source:   gogh
# Theme:    Lunaria Dark
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
    print_osc4 0 "36/46/4e"
    print_osc4 1 "84/65/60"
    print_osc4 2 "80/99/84"
    print_osc4 3 "a7/9a/79"
    print_osc4 4 "55/56/73"
    print_osc4 5 "86/6c/83"
    print_osc4 6 "7e/98/b4"
    print_osc4 7 "ca/ce/d8"
    print_osc4 8 "40/4f/56"
    print_osc4 9 "bb/92/8b"
    print_osc4 10 "bf/dc/c2"
    print_osc4 11 "f1/df/b6"
    print_osc4 12 "77/77/98"
    print_osc4 13 "bf/9d/b9"
    print_osc4 14 "bd/dc/ff"
    print_osc4 15 "df/e2/ed"

    print_osc_rgb 10 "ca/ce/d8"
    print_osc_rgb 11 "36/46/4e"
    print_osc_rgb 12 "ca/ce/d8"
    print_osc_rgb 17 "ca/ce/d8"
    print_osc_rgb 19 "36/46/4e"
}

do_linux() {
    print_linux 0 "#36464e"
    print_linux 1 "#846560"
    print_linux 2 "#809984"
    print_linux 3 "#a79a79"
    print_linux 4 "#555673"
    print_linux 5 "#866c83"
    print_linux 6 "#7e98b4"
    print_linux 7 "#caced8"
    print_linux 8 "#404f56"
    print_linux 9 "#bb928b"
    print_linux 10 "#bfdcc2"
    print_linux 11 "#f1dfb6"
    print_linux 12 "#777798"
    print_linux 13 "#bf9db9"
    print_linux 14 "#bddcff"
    print_linux 15 "#dfe2ed"
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
