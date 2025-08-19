#!/usr/bin/env bash

# Source:   base16
# Theme:    Porple
# Author:   Niek den Breeje (https://github.com/AuditeMarlow)
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
    print_osc4 0 "29/2c/36"
    print_osc4 1 "f8/45/47"
    print_osc4 2 "95/c7/6f"
    print_osc4 3 "ef/a1/6b"
    print_osc4 4 "84/85/ce"
    print_osc4 5 "b7/49/89"
    print_osc4 6 "64/87/8f"
    print_osc4 7 "d8/d8/d8"
    print_osc4 8 "65/56/8a"
    print_osc4 9 "f8/45/47"
    print_osc4 10 "95/c7/6f"
    print_osc4 11 "ef/a1/6b"
    print_osc4 12 "84/85/ce"
    print_osc4 13 "b7/49/89"
    print_osc4 14 "64/87/8f"
    print_osc4 15 "f8/f8/f8"

    print_osc_rgb 10 "d8/d8/d8"
    print_osc_rgb 11 "29/2c/36"
    print_osc_rgb 12 "d8/d8/d8"
    print_osc_rgb 17 "e8/e8/e8"
    print_osc_rgb 19 "33/33/44"
}

do_linux() {
    print_linux 0 "#292c36"
    print_linux 1 "#f84547"
    print_linux 2 "#95c76f"
    print_linux 3 "#efa16b"
    print_linux 4 "#8485ce"
    print_linux 5 "#b74989"
    print_linux 6 "#64878f"
    print_linux 7 "#d8d8d8"
    print_linux 8 "#65568a"
    print_linux 9 "#f84547"
    print_linux 10 "#95c76f"
    print_linux 11 "#efa16b"
    print_linux 12 "#8485ce"
    print_linux 13 "#b74989"
    print_linux 14 "#64878f"
    print_linux 15 "#f8f8f8"
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
