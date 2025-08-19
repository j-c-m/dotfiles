#!/usr/bin/env bash

# Source:   base16
# Theme:    Ashes
# Author:   Jannik Siebert (https://github.com/janniks)
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
    print_osc4 0 "1c/20/23"
    print_osc4 1 "c7/ae/95"
    print_osc4 2 "95/c7/ae"
    print_osc4 3 "ae/c7/95"
    print_osc4 4 "ae/95/c7"
    print_osc4 5 "c7/95/ae"
    print_osc4 6 "95/ae/c7"
    print_osc4 7 "c7/cc/d1"
    print_osc4 8 "74/7c/84"
    print_osc4 9 "c7/ae/95"
    print_osc4 10 "95/c7/ae"
    print_osc4 11 "ae/c7/95"
    print_osc4 12 "ae/95/c7"
    print_osc4 13 "c7/95/ae"
    print_osc4 14 "95/ae/c7"
    print_osc4 15 "f3/f4/f5"

    print_osc_rgb 10 "c7/cc/d1"
    print_osc_rgb 11 "1c/20/23"
    print_osc_rgb 12 "c7/cc/d1"
    print_osc_rgb 17 "df/e2/e5"
    print_osc_rgb 19 "39/3f/45"
}

do_linux() {
    print_linux 0 "#1c2023"
    print_linux 1 "#c7ae95"
    print_linux 2 "#95c7ae"
    print_linux 3 "#aec795"
    print_linux 4 "#ae95c7"
    print_linux 5 "#c795ae"
    print_linux 6 "#95aec7"
    print_linux 7 "#c7ccd1"
    print_linux 8 "#747c84"
    print_linux 9 "#c7ae95"
    print_linux 10 "#95c7ae"
    print_linux 11 "#aec795"
    print_linux 12 "#ae95c7"
    print_linux 13 "#c795ae"
    print_linux 14 "#95aec7"
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
