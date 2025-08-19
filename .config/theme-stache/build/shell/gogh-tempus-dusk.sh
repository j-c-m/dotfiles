#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Dusk
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "1f/25/2d"
    print_osc4 1 "cb/8d/56"
    print_osc4 2 "8b/a0/89"
    print_osc4 3 "a7/9c/46"
    print_osc4 4 "8c/9a/be"
    print_osc4 5 "b1/90/af"
    print_osc4 6 "8e/9a/ba"
    print_osc4 7 "a2/98/99"
    print_osc4 8 "2c/31/50"
    print_osc4 9 "d3/9d/74"
    print_osc4 10 "80/b4/8f"
    print_osc4 11 "bd/a7/5a"
    print_osc4 12 "9c/a5/de"
    print_osc4 13 "c6/9a/c6"
    print_osc4 14 "8c/ae/b6"
    print_osc4 15 "a2/a8/ba"

    print_osc_rgb 10 "a2/a8/ba"
    print_osc_rgb 11 "1f/25/2d"
    print_osc_rgb 12 "a2/a8/ba"
    print_osc_rgb 17 "a2/a8/ba"
    print_osc_rgb 19 "1f/25/2d"
}

do_linux() {
    print_linux 0 "#1f252d"
    print_linux 1 "#cb8d56"
    print_linux 2 "#8ba089"
    print_linux 3 "#a79c46"
    print_linux 4 "#8c9abe"
    print_linux 5 "#b190af"
    print_linux 6 "#8e9aba"
    print_linux 7 "#a2a8ba"
    print_linux 8 "#2c3150"
    print_linux 9 "#d39d74"
    print_linux 10 "#80b48f"
    print_linux 11 "#bda75a"
    print_linux 12 "#9ca5de"
    print_linux 13 "#c69ac6"
    print_linux 14 "#8caeb6"
    print_linux 15 "#a2a8ba"
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
