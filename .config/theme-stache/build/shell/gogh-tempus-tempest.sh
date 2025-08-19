#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Tempest
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
    print_osc4 0 "28/2b/2b"
    print_osc4 1 "cf/c8/0a"
    print_osc4 2 "7a/d9/7a"
    print_osc4 3 "bf/cc/4a"
    print_osc4 4 "60/d7/cd"
    print_osc4 5 "c5/c4/af"
    print_osc4 6 "8b/d0/bf"
    print_osc4 7 "b0/c8/ca"
    print_osc4 8 "32/35/35"
    print_osc4 9 "d1/d9/33"
    print_osc4 10 "99/e2/99"
    print_osc4 11 "bb/de/4f"
    print_osc4 12 "74/e4/cd"
    print_osc4 13 "d2/d4/aa"
    print_osc4 14 "9b/df/c4"
    print_osc4 15 "b6/e0/ca"

    print_osc_rgb 10 "b6/e0/ca"
    print_osc_rgb 11 "28/2b/2b"
    print_osc_rgb 12 "b6/e0/ca"
    print_osc_rgb 17 "b6/e0/ca"
    print_osc_rgb 19 "28/2b/2b"
}

do_linux() {
    print_linux 0 "#282b2b"
    print_linux 1 "#cfc80a"
    print_linux 2 "#7ad97a"
    print_linux 3 "#bfcc4a"
    print_linux 4 "#60d7cd"
    print_linux 5 "#c5c4af"
    print_linux 6 "#8bd0bf"
    print_linux 7 "#b6e0ca"
    print_linux 8 "#323535"
    print_linux 9 "#d1d933"
    print_linux 10 "#99e299"
    print_linux 11 "#bbde4f"
    print_linux 12 "#74e4cd"
    print_linux 13 "#d2d4aa"
    print_linux 14 "#9bdfc4"
    print_linux 15 "#b6e0ca"
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
