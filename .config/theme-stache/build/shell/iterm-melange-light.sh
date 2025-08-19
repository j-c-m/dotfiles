#!/usr/bin/env bash

# Source:   iterm
# Theme:    Melange_light
# Author:   unknown
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "e9/e0/da"
    print_osc4 1 "c7/7a/8b"
    print_osc4 2 "6e/9a/71"
    print_osc4 3 "bb/5b/00"
    print_osc4 4 "78/91/bd"
    print_osc4 5 "be/79/ba"
    print_osc4 6 "72/97/97"
    print_osc4 7 "7c/66/58"
    print_osc4 8 "a9/8a/78"
    print_osc4 9 "bf/00/20"
    print_osc4 10 "3a/67/49"
    print_osc4 11 "a0/6d/00"
    print_osc4 12 "46/5a/a3"
    print_osc4 13 "8f/40/80"
    print_osc4 14 "3d/65/67"
    print_osc4 15 "53/43/3a"

    print_osc_rgb 10 "53/43/3a"
    print_osc_rgb 11 "f1/f1/f1"
    print_osc_rgb 12 "53/43/3a"
    print_osc_rgb 17 "53/43/3a"
    print_osc_rgb 19 "d8/d3/cd"
}

do_linux() {
    print_linux 0 "#e9e0da"
    print_linux 1 "#c77a8b"
    print_linux 2 "#6e9a71"
    print_linux 3 "#bb5b00"
    print_linux 4 "#7891bd"
    print_linux 5 "#be79ba"
    print_linux 6 "#729797"
    print_linux 7 "#53433a"
    print_linux 8 "#a98a78"
    print_linux 9 "#bf0020"
    print_linux 10 "#3a6749"
    print_linux 11 "#a06d00"
    print_linux 12 "#465aa3"
    print_linux 13 "#8f4080"
    print_linux 14 "#3d6567"
    print_linux 15 "#53433a"
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
