#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Sulphurpool Light
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
    print_osc4 0 "f5/f7/ff"
    print_osc4 1 "c9/49/22"
    print_osc4 2 "ac/97/39"
    print_osc4 3 "c0/8b/30"
    print_osc4 4 "3d/8f/d1"
    print_osc4 5 "66/79/cc"
    print_osc4 6 "22/a2/c9"
    print_osc4 7 "5e/66/87"
    print_osc4 8 "89/8e/a4"
    print_osc4 9 "c9/49/22"
    print_osc4 10 "ac/97/39"
    print_osc4 11 "c0/8b/30"
    print_osc4 12 "3d/8f/d1"
    print_osc4 13 "66/79/cc"
    print_osc4 14 "22/a2/c9"
    print_osc4 15 "20/27/46"

    print_osc_rgb 10 "5e/66/87"
    print_osc_rgb 11 "f5/f7/ff"
    print_osc_rgb 12 "5e/66/87"
    print_osc_rgb 17 "29/32/56"
    print_osc_rgb 19 "df/e2/f1"
}

do_linux() {
    print_linux 0 "#f5f7ff"
    print_linux 1 "#c94922"
    print_linux 2 "#ac9739"
    print_linux 3 "#c08b30"
    print_linux 4 "#3d8fd1"
    print_linux 5 "#6679cc"
    print_linux 6 "#22a2c9"
    print_linux 7 "#5e6687"
    print_linux 8 "#898ea4"
    print_linux 9 "#c94922"
    print_linux 10 "#ac9739"
    print_linux 11 "#c08b30"
    print_linux 12 "#3d8fd1"
    print_linux 13 "#6679cc"
    print_linux 14 "#22a2c9"
    print_linux 15 "#202746"
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
