#!/usr/bin/env bash

# Source:   base16
# Theme:    One Light
# Author:   Daniel Pfeifer (http://github.com/purpleKarrot)
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
    print_osc4 0 "fa/fa/fa"
    print_osc4 1 "ca/12/43"
    print_osc4 2 "50/a1/4f"
    print_osc4 3 "c1/84/01"
    print_osc4 4 "40/78/f2"
    print_osc4 5 "a6/26/a4"
    print_osc4 6 "01/84/bc"
    print_osc4 7 "38/3a/42"
    print_osc4 8 "a0/a1/a7"
    print_osc4 9 "ca/12/43"
    print_osc4 10 "50/a1/4f"
    print_osc4 11 "c1/84/01"
    print_osc4 12 "40/78/f2"
    print_osc4 13 "a6/26/a4"
    print_osc4 14 "01/84/bc"
    print_osc4 15 "09/0a/0b"

    print_osc_rgb 10 "38/3a/42"
    print_osc_rgb 11 "fa/fa/fa"
    print_osc_rgb 12 "38/3a/42"
    print_osc_rgb 17 "20/22/27"
    print_osc_rgb 19 "f0/f0/f1"
}

do_linux() {
    print_linux 0 "#fafafa"
    print_linux 1 "#ca1243"
    print_linux 2 "#50a14f"
    print_linux 3 "#c18401"
    print_linux 4 "#4078f2"
    print_linux 5 "#a626a4"
    print_linux 6 "#0184bc"
    print_linux 7 "#383a42"
    print_linux 8 "#a0a1a7"
    print_linux 9 "#ca1243"
    print_linux 10 "#50a14f"
    print_linux 11 "#c18401"
    print_linux 12 "#4078f2"
    print_linux 13 "#a626a4"
    print_linux 14 "#0184bc"
    print_linux 15 "#090a0b"
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
