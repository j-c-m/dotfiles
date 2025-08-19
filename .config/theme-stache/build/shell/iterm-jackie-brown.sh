#!/usr/bin/env bash

# Source:   iterm
# Theme:    Jackie Brown
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "2c/1d/16"
    print_osc4 1 "ef/57/34"
    print_osc4 2 "2b/af/2b"
    print_osc4 3 "bd/be/00"
    print_osc4 4 "24/6d/b2"
    print_osc4 5 "cf/5e/c0"
    print_osc4 6 "00/ac/ee"
    print_osc4 7 "bf/bf/bf"
    print_osc4 8 "66/66/66"
    print_osc4 9 "e5/00/00"
    print_osc4 10 "86/a8/3e"
    print_osc4 11 "e5/e5/00"
    print_osc4 12 "00/00/ff"
    print_osc4 13 "e5/00/e5"
    print_osc4 14 "00/e5/e5"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "ff/cc/2f"
    print_osc_rgb 11 "2c/1c/15"
    print_osc_rgb 12 "23/ff/18"
    print_osc_rgb 17 "ae/8c/20"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#2c1d16"
    print_linux 1 "#ef5734"
    print_linux 2 "#2baf2b"
    print_linux 3 "#bdbe00"
    print_linux 4 "#246db2"
    print_linux 5 "#cf5ec0"
    print_linux 6 "#00acee"
    print_linux 7 "#ffcc2f"
    print_linux 8 "#666666"
    print_linux 9 "#e50000"
    print_linux 10 "#86a83e"
    print_linux 11 "#e5e500"
    print_linux 12 "#0000ff"
    print_linux 13 "#e500e5"
    print_linux 14 "#00e5e5"
    print_linux 15 "#e5e5e5"
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
