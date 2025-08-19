#!/usr/bin/env bash

# Source:   base16
# Theme:    Horizon Light
# Author:   Michaël Ball (http://github.com/michael-ball/)
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
    print_osc4 0 "fd/f0/ed"
    print_osc4 1 "f7/93/9b"
    print_osc4 2 "94/e1/b0"
    print_osc4 3 "fb/e0/d9"
    print_osc4 4 "da/10/3f"
    print_osc4 5 "1d/89/91"
    print_osc4 6 "dc/33/18"
    print_osc4 7 "40/3c/3d"
    print_osc4 8 "bd/b3/b1"
    print_osc4 9 "f7/93/9b"
    print_osc4 10 "94/e1/b0"
    print_osc4 11 "fb/e0/d9"
    print_osc4 12 "da/10/3f"
    print_osc4 13 "1d/89/91"
    print_osc4 14 "dc/33/18"
    print_osc4 15 "20/1c/1d"

    print_osc_rgb 10 "40/3c/3d"
    print_osc_rgb 11 "fd/f0/ed"
    print_osc_rgb 12 "40/3c/3d"
    print_osc_rgb 17 "30/2c/2d"
    print_osc_rgb 19 "fa/da/d1"
}

do_linux() {
    print_linux 0 "#fdf0ed"
    print_linux 1 "#f7939b"
    print_linux 2 "#94e1b0"
    print_linux 3 "#fbe0d9"
    print_linux 4 "#da103f"
    print_linux 5 "#1d8991"
    print_linux 6 "#dc3318"
    print_linux 7 "#403c3d"
    print_linux 8 "#bdb3b1"
    print_linux 9 "#f7939b"
    print_linux 10 "#94e1b0"
    print_linux 11 "#fbe0d9"
    print_linux 12 "#da103f"
    print_linux 13 "#1d8991"
    print_linux 14 "#dc3318"
    print_linux 15 "#201c1d"
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
