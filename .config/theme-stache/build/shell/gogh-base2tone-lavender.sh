#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Lavender
# Author:   
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
    print_osc4 0 "20/1d/2a"
    print_osc4 1 "93/75/f5"
    print_osc4 2 "d2/94/ff"
    print_osc4 3 "ec/d1/ff"
    print_osc4 4 "a2/86/fd"
    print_osc4 5 "d2/94/ff"
    print_osc4 6 "b5/a0/fe"
    print_osc4 7 "99/92/b0"
    print_osc4 8 "62/5a/7c"
    print_osc4 9 "db/a8/ff"
    print_osc4 10 "2c/28/39"
    print_osc4 11 "4b/45/5f"
    print_osc4 12 "6e/65/8b"
    print_osc4 13 "dc/d2/fe"
    print_osc4 14 "ca/80/ff"
    print_osc4 15 "ef/eb/ff"

    print_osc_rgb 10 "99/92/b0"
    print_osc_rgb 11 "20/1d/2a"
    print_osc_rgb 12 "b0/42/ff"
    print_osc_rgb 17 "99/92/b0"
    print_osc_rgb 19 "20/1d/2a"
}

do_linux() {
    print_linux 0 "#201d2a"
    print_linux 1 "#9375f5"
    print_linux 2 "#d294ff"
    print_linux 3 "#ecd1ff"
    print_linux 4 "#a286fd"
    print_linux 5 "#d294ff"
    print_linux 6 "#b5a0fe"
    print_linux 7 "#9992b0"
    print_linux 8 "#625a7c"
    print_linux 9 "#dba8ff"
    print_linux 10 "#2c2839"
    print_linux 11 "#4b455f"
    print_linux 12 "#6e658b"
    print_linux 13 "#dcd2fe"
    print_linux 14 "#ca80ff"
    print_linux 15 "#efebff"
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
