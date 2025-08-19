#!/usr/bin/env bash

# Source:   base16
# Theme:    Ayu Mirage
# Author:   Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)
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
    print_osc4 0 "1f/24/30"
    print_osc4 1 "f2/87/79"
    print_osc4 2 "d5/ff/80"
    print_osc4 3 "ff/d1/73"
    print_osc4 4 "73/d0/ff"
    print_osc4 5 "d4/bf/ff"
    print_osc4 6 "95/e6/cb"
    print_osc4 7 "cc/ca/c2"
    print_osc4 8 "4a/50/59"
    print_osc4 9 "f2/87/79"
    print_osc4 10 "d5/ff/80"
    print_osc4 11 "ff/d1/73"
    print_osc4 12 "73/d0/ff"
    print_osc4 13 "d4/bf/ff"
    print_osc4 14 "95/e6/cb"
    print_osc4 15 "f3/f4/f5"

    print_osc_rgb 10 "cc/ca/c2"
    print_osc_rgb 11 "1f/24/30"
    print_osc_rgb 12 "cc/ca/c2"
    print_osc_rgb 17 "d9/d7/ce"
    print_osc_rgb 19 "24/29/36"
}

do_linux() {
    print_linux 0 "#1f2430"
    print_linux 1 "#f28779"
    print_linux 2 "#d5ff80"
    print_linux 3 "#ffd173"
    print_linux 4 "#73d0ff"
    print_linux 5 "#d4bfff"
    print_linux 6 "#95e6cb"
    print_linux 7 "#cccac2"
    print_linux 8 "#4a5059"
    print_linux 9 "#f28779"
    print_linux 10 "#d5ff80"
    print_linux 11 "#ffd173"
    print_linux 12 "#73d0ff"
    print_linux 13 "#d4bfff"
    print_linux 14 "#95e6cb"
    print_linux 15 "#f3f4f5"
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
