#!/usr/bin/env bash

# Source:   base16
# Theme:    Nord Light
# Author:   threddast, based on fuxialexander&#x27;s doom-nord-light-theme (Doom Emacs)
# Variant:  light

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
    print_osc4 0 "e5/e9/f0"
    print_osc4 1 "99/32/4b"
    print_osc4 2 "4f/89/4c"
    print_osc4 3 "9a/75/00"
    print_osc4 4 "3b/6e/a8"
    print_osc4 5 "97/36/5b"
    print_osc4 6 "39/8e/ac"
    print_osc4 7 "2e/34/40"
    print_osc4 8 "ae/ba/cf"
    print_osc4 9 "99/32/4b"
    print_osc4 10 "4f/89/4c"
    print_osc4 11 "9a/75/00"
    print_osc4 12 "3b/6e/a8"
    print_osc4 13 "97/36/5b"
    print_osc4 14 "39/8e/ac"
    print_osc4 15 "29/83/8d"

    print_osc_rgb 10 "2e/34/40"
    print_osc_rgb 11 "e5/e9/f0"
    print_osc_rgb 12 "2e/34/40"
    print_osc_rgb 17 "3b/42/52"
    print_osc_rgb 19 "c2/d0/e7"
}

do_linux() {
    print_linux 0 "#e5e9f0"
    print_linux 1 "#99324b"
    print_linux 2 "#4f894c"
    print_linux 3 "#9a7500"
    print_linux 4 "#3b6ea8"
    print_linux 5 "#97365b"
    print_linux 6 "#398eac"
    print_linux 7 "#2e3440"
    print_linux 8 "#aebacf"
    print_linux 9 "#99324b"
    print_linux 10 "#4f894c"
    print_linux 11 "#9a7500"
    print_linux 12 "#3b6ea8"
    print_linux 13 "#97365b"
    print_linux 14 "#398eac"
    print_linux 15 "#29838d"
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
