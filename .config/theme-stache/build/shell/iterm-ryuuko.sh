#!/usr/bin/env bash

# Source:   iterm
# Theme:    Ryuuko
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "2b/38/40"
    print_osc4 1 "86/5e/5a"
    print_osc4 2 "65/8f/7d"
    print_osc4 3 "b1/a8/8f"
    print_osc4 4 "69/8d/95"
    print_osc4 5 "b0/8a/73"
    print_osc4 6 "88/b2/ab"
    print_osc4 7 "ec/ec/ec"
    print_osc4 8 "5d/6f/79"
    print_osc4 9 "86/5e/5a"
    print_osc4 10 "65/8f/7d"
    print_osc4 11 "b1/a8/8f"
    print_osc4 12 "69/8d/95"
    print_osc4 13 "b0/8a/73"
    print_osc4 14 "88/b2/ab"
    print_osc4 15 "ec/ec/ec"

    print_osc_rgb 10 "ec/ec/ec"
    print_osc_rgb 11 "2b/38/40"
    print_osc_rgb 12 "ec/ec/ec"
    print_osc_rgb 17 "00/27/31"
    print_osc_rgb 19 "81/90/8f"
}

do_linux() {
    print_linux 0 "#2b3840"
    print_linux 1 "#865e5a"
    print_linux 2 "#658f7d"
    print_linux 3 "#b1a88f"
    print_linux 4 "#698d95"
    print_linux 5 "#b08a73"
    print_linux 6 "#88b2ab"
    print_linux 7 "#ececec"
    print_linux 8 "#5d6f79"
    print_linux 9 "#865e5a"
    print_linux 10 "#658f7d"
    print_linux 11 "#b1a88f"
    print_linux 12 "#698d95"
    print_linux 13 "#b08a73"
    print_linux 14 "#88b2ab"
    print_linux 15 "#ececec"
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
