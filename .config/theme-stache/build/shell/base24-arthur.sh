#!/usr/bin/env bash

# Source:   base24
# Theme:    Arthur
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "1c/1c/1c"
    print_osc4 1 "cd/5c/5c"
    print_osc4 2 "86/af/80"
    print_osc4 3 "87/ce/eb"
    print_osc4 4 "64/95/ed"
    print_osc4 5 "de/b8/87"
    print_osc4 6 "b0/c4/de"
    print_osc4 7 "a1/90/83"
    print_osc4 8 "6e/5d/59"
    print_osc4 9 "cc/55/33"
    print_osc4 10 "88/aa/22"
    print_osc4 11 "ff/a7/5d"
    print_osc4 12 "87/ce/eb"
    print_osc4 13 "99/66/00"
    print_osc4 14 "b0/c4/de"
    print_osc4 15 "dd/cc/bb"

    print_osc_rgb 10 "a1/90/83"
    print_osc_rgb 11 "1c/1c/1c"
    print_osc_rgb 12 "a1/90/83"
    print_osc_rgb 17 "bb/aa/99"
    print_osc_rgb 19 "3d/35/2a"
}

do_linux() {
    print_linux 0 "#1c1c1c"
    print_linux 1 "#cd5c5c"
    print_linux 2 "#86af80"
    print_linux 3 "#87ceeb"
    print_linux 4 "#6495ed"
    print_linux 5 "#deb887"
    print_linux 6 "#b0c4de"
    print_linux 7 "#a19083"
    print_linux 8 "#6e5d59"
    print_linux 9 "#cc5533"
    print_linux 10 "#88aa22"
    print_linux 11 "#ffa75d"
    print_linux 12 "#87ceeb"
    print_linux 13 "#996600"
    print_linux 14 "#b0c4de"
    print_linux 15 "#ddccbb"
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
