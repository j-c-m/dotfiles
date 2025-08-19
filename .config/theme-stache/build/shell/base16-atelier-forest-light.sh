#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Forest Light
# Author:   Bram de Haan (http://atelierbramdehaan.nl)
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
    print_osc4 0 "f1/ef/ee"
    print_osc4 1 "f2/2c/40"
    print_osc4 2 "7b/97/26"
    print_osc4 3 "c3/84/18"
    print_osc4 4 "40/7e/e7"
    print_osc4 5 "66/66/ea"
    print_osc4 6 "3d/97/b8"
    print_osc4 7 "68/61/5e"
    print_osc4 8 "9c/94/91"
    print_osc4 9 "f2/2c/40"
    print_osc4 10 "7b/97/26"
    print_osc4 11 "c3/84/18"
    print_osc4 12 "40/7e/e7"
    print_osc4 13 "66/66/ea"
    print_osc4 14 "3d/97/b8"
    print_osc4 15 "1b/19/18"

    print_osc_rgb 10 "68/61/5e"
    print_osc_rgb 11 "f1/ef/ee"
    print_osc_rgb 12 "68/61/5e"
    print_osc_rgb 17 "2c/24/21"
    print_osc_rgb 19 "e6/e2/e0"
}

do_linux() {
    print_linux 0 "#f1efee"
    print_linux 1 "#f22c40"
    print_linux 2 "#7b9726"
    print_linux 3 "#c38418"
    print_linux 4 "#407ee7"
    print_linux 5 "#6666ea"
    print_linux 6 "#3d97b8"
    print_linux 7 "#68615e"
    print_linux 8 "#9c9491"
    print_linux 9 "#f22c40"
    print_linux 10 "#7b9726"
    print_linux 11 "#c38418"
    print_linux 12 "#407ee7"
    print_linux 13 "#6666ea"
    print_linux 14 "#3d97b8"
    print_linux 15 "#1b1918"
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
