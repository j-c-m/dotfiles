#!/usr/bin/env bash

# Source:   base16
# Theme:    Harmonic16 Dark
# Author:   Jannik Siebert (https://github.com/janniks)
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
    print_osc4 0 "0b/1c/2c"
    print_osc4 1 "bf/8b/56"
    print_osc4 2 "56/bf/8b"
    print_osc4 3 "8b/bf/56"
    print_osc4 4 "8b/56/bf"
    print_osc4 5 "bf/56/8b"
    print_osc4 6 "56/8b/bf"
    print_osc4 7 "cb/d6/e2"
    print_osc4 8 "62/7e/99"
    print_osc4 9 "bf/8b/56"
    print_osc4 10 "56/bf/8b"
    print_osc4 11 "8b/bf/56"
    print_osc4 12 "8b/56/bf"
    print_osc4 13 "bf/56/8b"
    print_osc4 14 "56/8b/bf"
    print_osc4 15 "f7/f9/fb"

    print_osc_rgb 10 "cb/d6/e2"
    print_osc_rgb 11 "0b/1c/2c"
    print_osc_rgb 12 "cb/d6/e2"
    print_osc_rgb 17 "e5/eb/f1"
    print_osc_rgb 19 "22/3b/54"
}

do_linux() {
    print_linux 0 "#0b1c2c"
    print_linux 1 "#bf8b56"
    print_linux 2 "#56bf8b"
    print_linux 3 "#8bbf56"
    print_linux 4 "#8b56bf"
    print_linux 5 "#bf568b"
    print_linux 6 "#568bbf"
    print_linux 7 "#cbd6e2"
    print_linux 8 "#627e99"
    print_linux 9 "#bf8b56"
    print_linux 10 "#56bf8b"
    print_linux 11 "#8bbf56"
    print_linux 12 "#8b56bf"
    print_linux 13 "#bf568b"
    print_linux 14 "#568bbf"
    print_linux 15 "#f7f9fb"
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
