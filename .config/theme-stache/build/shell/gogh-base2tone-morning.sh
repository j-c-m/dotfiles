#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Morning
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
    print_osc4 0 "23/28/34"
    print_osc4 1 "16/59/df"
    print_osc4 2 "b2/97/62"
    print_osc4 3 "e5/dd/cd"
    print_osc4 4 "3d/75/e6"
    print_osc4 5 "b2/97/62"
    print_osc4 6 "72/8f/cb"
    print_osc4 7 "8d/95/a5"
    print_osc4 8 "65/6e/81"
    print_osc4 9 "c6/b2/8b"
    print_osc4 10 "31/36/3f"
    print_osc4 11 "4f/56/64"
    print_osc4 12 "70/7a/8f"
    print_osc4 13 "b7/c9/eb"
    print_osc4 14 "9a/7c/42"
    print_osc4 15 "de/e6/f7"

    print_osc_rgb 10 "8d/95/a5"
    print_osc_rgb 11 "23/28/34"
    print_osc_rgb 12 "59/42/12"
    print_osc_rgb 17 "8d/95/a5"
    print_osc_rgb 19 "23/28/34"
}

do_linux() {
    print_linux 0 "#232834"
    print_linux 1 "#1659df"
    print_linux 2 "#b29762"
    print_linux 3 "#e5ddcd"
    print_linux 4 "#3d75e6"
    print_linux 5 "#b29762"
    print_linux 6 "#728fcb"
    print_linux 7 "#8d95a5"
    print_linux 8 "#656e81"
    print_linux 9 "#c6b28b"
    print_linux 10 "#31363f"
    print_linux 11 "#4f5664"
    print_linux 12 "#707a8f"
    print_linux 13 "#b7c9eb"
    print_linux 14 "#9a7c42"
    print_linux 15 "#dee6f7"
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
