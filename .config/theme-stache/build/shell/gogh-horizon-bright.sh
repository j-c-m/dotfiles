#!/usr/bin/env bash

# Source:   gogh
# Theme:    Horizon Bright
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
    print_osc4 0 "16/16/1c"
    print_osc4 1 "da/10/3f"
    print_osc4 2 "1e/b9/80"
    print_osc4 3 "f6/66/1e"
    print_osc4 4 "26/bb/d9"
    print_osc4 5 "ee/64/ae"
    print_osc4 6 "1d/89/91"
    print_osc4 7 "fa/da/d1"
    print_osc4 8 "1a/1c/23"
    print_osc4 9 "f4/3e/5c"
    print_osc4 10 "07/da/8c"
    print_osc4 11 "f7/7d/26"
    print_osc4 12 "3f/c6/de"
    print_osc4 13 "f0/75/b7"
    print_osc4 14 "1e/ae/ae"
    print_osc4 15 "fd/f0/ed"

    print_osc_rgb 10 "1c/1e/26"
    print_osc_rgb 11 "fd/f0/ed"
    print_osc_rgb 12 "1c/1e/26"
    print_osc_rgb 17 "1c/1e/26"
    print_osc_rgb 19 "fd/f0/ed"
}

do_linux() {
    print_linux 0 "#16161c"
    print_linux 1 "#da103f"
    print_linux 2 "#1eb980"
    print_linux 3 "#f6661e"
    print_linux 4 "#26bbd9"
    print_linux 5 "#ee64ae"
    print_linux 6 "#1d8991"
    print_linux 7 "#1c1e26"
    print_linux 8 "#1a1c23"
    print_linux 9 "#f43e5c"
    print_linux 10 "#07da8c"
    print_linux 11 "#f77d26"
    print_linux 12 "#3fc6de"
    print_linux 13 "#f075b7"
    print_linux 14 "#1eaeae"
    print_linux 15 "#fdf0ed"
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
