#!/usr/bin/env bash

# Source:   base16
# Theme:    Apprentice
# Author:   romainl
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
    print_osc4 0 "26/26/26"
    print_osc4 1 "44/44/44"
    print_osc4 2 "ff/ff/af"
    print_osc4 3 "87/af/87"
    print_osc4 4 "87/87/af"
    print_osc4 5 "5f/af/af"
    print_osc4 6 "87/af/d7"
    print_osc4 7 "5f/5f/87"
    print_osc4 8 "87/87/5f"
    print_osc4 9 "44/44/44"
    print_osc4 10 "ff/ff/af"
    print_osc4 11 "87/af/87"
    print_osc4 12 "87/87/af"
    print_osc4 13 "5f/af/af"
    print_osc4 14 "87/af/d7"
    print_osc4 15 "6c/6c/6c"

    print_osc_rgb 10 "5f/5f/87"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "5f/5f/87"
    print_osc_rgb 17 "5f/87/87"
    print_osc_rgb 19 "af/5f/5f"
}

do_linux() {
    print_linux 0 "#262626"
    print_linux 1 "#444444"
    print_linux 2 "#ffffaf"
    print_linux 3 "#87af87"
    print_linux 4 "#8787af"
    print_linux 5 "#5fafaf"
    print_linux 6 "#87afd7"
    print_linux 7 "#5f5f87"
    print_linux 8 "#87875f"
    print_linux 9 "#444444"
    print_linux 10 "#ffffaf"
    print_linux 11 "#87af87"
    print_linux 12 "#8787af"
    print_linux 13 "#5fafaf"
    print_linux 14 "#87afd7"
    print_linux 15 "#6c6c6c"
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
