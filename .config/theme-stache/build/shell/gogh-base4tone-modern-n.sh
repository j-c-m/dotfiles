#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Modern N
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
    print_osc4 0 "1a/20/23"
    print_osc4 1 "d5/39/75"
    print_osc4 2 "a4/8f/04"
    print_osc4 3 "dc/c2/18"
    print_osc4 4 "47/b5/f5"
    print_osc4 5 "84/93/f6"
    print_osc4 6 "c1/aa/15"
    print_osc4 7 "e8/eb/ee"
    print_osc4 8 "07/0b/0d"
    print_osc4 9 "eb/75/a2"
    print_osc4 10 "e6/ca/1a"
    print_osc4 11 "f2/e5/8c"
    print_osc4 12 "bb/e4/fb"
    print_osc4 13 "a0/ac/f8"
    print_osc4 14 "b1/e0/fb"
    print_osc4 15 "f6/f8/f9"

    print_osc_rgb 10 "8a/9d/a8"
    print_osc_rgb 11 "1a/20/23"
    print_osc_rgb 12 "85/82/6f"
    print_osc_rgb 17 "8a/9d/a8"
    print_osc_rgb 19 "1a/20/23"
}

do_linux() {
    print_linux 0 "#1a2023"
    print_linux 1 "#d53975"
    print_linux 2 "#a48f04"
    print_linux 3 "#dcc218"
    print_linux 4 "#47b5f5"
    print_linux 5 "#8493f6"
    print_linux 6 "#c1aa15"
    print_linux 7 "#8a9da8"
    print_linux 8 "#070b0d"
    print_linux 9 "#eb75a2"
    print_linux 10 "#e6ca1a"
    print_linux 11 "#f2e58c"
    print_linux 12 "#bbe4fb"
    print_linux 13 "#a0acf8"
    print_linux 14 "#b1e0fb"
    print_linux 15 "#f6f8f9"
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
