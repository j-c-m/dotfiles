#!/usr/bin/env bash

# Source:   base16
# Theme:    UwUnicorn
# Author:   Fernando Marques (https://github.com/RakkiUwU) and Gabriel Fontes (https://github.com/Misterio77)
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
    print_osc4 0 "24/1b/26"
    print_osc4 1 "87/7b/b6"
    print_osc4 2 "c9/65/bf"
    print_osc4 3 "a8/4a/73"
    print_osc4 4 "6a/9e/b5"
    print_osc4 5 "78/a3/8f"
    print_osc4 6 "9c/5f/ce"
    print_osc4 7 "ee/d5/d9"
    print_osc4 8 "6c/3c/b2"
    print_osc4 9 "87/7b/b6"
    print_osc4 10 "c9/65/bf"
    print_osc4 11 "a8/4a/73"
    print_osc4 12 "6a/9e/b5"
    print_osc4 13 "78/a3/8f"
    print_osc4 14 "9c/5f/ce"
    print_osc4 15 "e4/cc/d0"

    print_osc_rgb 10 "ee/d5/d9"
    print_osc_rgb 11 "24/1b/26"
    print_osc_rgb 12 "ee/d5/d9"
    print_osc_rgb 17 "d9/c2/c6"
    print_osc_rgb 19 "2f/2a/3f"
}

do_linux() {
    print_linux 0 "#241b26"
    print_linux 1 "#877bb6"
    print_linux 2 "#c965bf"
    print_linux 3 "#a84a73"
    print_linux 4 "#6a9eb5"
    print_linux 5 "#78a38f"
    print_linux 6 "#9c5fce"
    print_linux 7 "#eed5d9"
    print_linux 8 "#6c3cb2"
    print_linux 9 "#877bb6"
    print_linux 10 "#c965bf"
    print_linux 11 "#a84a73"
    print_linux 12 "#6a9eb5"
    print_linux 13 "#78a38f"
    print_linux 14 "#9c5fce"
    print_linux 15 "#e4ccd0"
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
