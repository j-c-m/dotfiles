#!/usr/bin/env bash

# Source:   iterm
# Theme:    ToyChest
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "2c/3f/57"
    print_osc4 1 "be/2d/26"
    print_osc4 2 "19/91/71"
    print_osc4 3 "da/8e/26"
    print_osc4 4 "32/5d/96"
    print_osc4 5 "8a/5d/db"
    print_osc4 6 "35/a0/8f"
    print_osc4 7 "23/d0/82"
    print_osc4 8 "32/68/89"
    print_osc4 9 "dd/59/43"
    print_osc4 10 "30/cf/7b"
    print_osc4 11 "e7/d7/4b"
    print_osc4 12 "33/a5/d9"
    print_osc4 13 "ad/6b/dc"
    print_osc4 14 "41/c3/ad"
    print_osc4 15 "d4/d4/d4"

    print_osc_rgb 10 "30/cf/7b"
    print_osc_rgb 11 "23/36/4a"
    print_osc_rgb 12 "d4/d4/d4"
    print_osc_rgb 17 "5f/20/7a"
    print_osc_rgb 19 "d4/d4/d4"
}

do_linux() {
    print_linux 0 "#2c3f57"
    print_linux 1 "#be2d26"
    print_linux 2 "#199171"
    print_linux 3 "#da8e26"
    print_linux 4 "#325d96"
    print_linux 5 "#8a5ddb"
    print_linux 6 "#35a08f"
    print_linux 7 "#30cf7b"
    print_linux 8 "#326889"
    print_linux 9 "#dd5943"
    print_linux 10 "#30cf7b"
    print_linux 11 "#e7d74b"
    print_linux 12 "#33a5d9"
    print_linux 13 "#ad6bdc"
    print_linux 14 "#41c3ad"
    print_linux 15 "#d4d4d4"
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
