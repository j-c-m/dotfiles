#!/usr/bin/env bash

# Source:   base16
# Theme:    Sandcastle
# Author:   George Essig (https://github.com/gessig)
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
    print_osc4 0 "28/2c/34"
    print_osc4 1 "83/a5/98"
    print_osc4 2 "52/8b/8b"
    print_osc4 3 "a0/7e/3b"
    print_osc4 4 "83/a5/98"
    print_osc4 5 "d7/5f/5f"
    print_osc4 6 "83/a5/98"
    print_osc4 7 "a8/99/84"
    print_osc4 8 "66/5c/54"
    print_osc4 9 "83/a5/98"
    print_osc4 10 "52/8b/8b"
    print_osc4 11 "a0/7e/3b"
    print_osc4 12 "83/a5/98"
    print_osc4 13 "d7/5f/5f"
    print_osc4 14 "83/a5/98"
    print_osc4 15 "fd/f4/c1"

    print_osc_rgb 10 "a8/99/84"
    print_osc_rgb 11 "28/2c/34"
    print_osc_rgb 12 "a8/99/84"
    print_osc_rgb 17 "d5/c4/a1"
    print_osc_rgb 19 "2c/32/3b"
}

do_linux() {
    print_linux 0 "#282c34"
    print_linux 1 "#83a598"
    print_linux 2 "#528b8b"
    print_linux 3 "#a07e3b"
    print_linux 4 "#83a598"
    print_linux 5 "#d75f5f"
    print_linux 6 "#83a598"
    print_linux 7 "#a89984"
    print_linux 8 "#665c54"
    print_linux 9 "#83a598"
    print_linux 10 "#528b8b"
    print_linux 11 "#a07e3b"
    print_linux 12 "#83a598"
    print_linux 13 "#d75f5f"
    print_linux 14 "#83a598"
    print_linux 15 "#fdf4c1"
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
