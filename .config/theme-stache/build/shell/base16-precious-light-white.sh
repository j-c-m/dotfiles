#!/usr/bin/env bash

# Source:   base16
# Theme:    Precious Light White
# Author:   4lex4 &lt;4lex49@zoho.com&gt;
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
    print_osc4 0 "ff/ff/ff"
    print_osc4 1 "af/49/47"
    print_osc4 2 "55/73/01"
    print_osc4 3 "87/65/00"
    print_osc4 4 "18/6d/aa"
    print_osc4 5 "7b/4e/cb"
    print_osc4 6 "08/77/67"
    print_osc4 7 "55/55/55"
    print_osc4 8 "84/84/84"
    print_osc4 9 "af/49/47"
    print_osc4 10 "55/73/01"
    print_osc4 11 "87/65/00"
    print_osc4 12 "18/6d/aa"
    print_osc4 13 "7b/4e/cb"
    print_osc4 14 "08/77/67"
    print_osc4 15 "55/55/55"

    print_osc_rgb 10 "55/55/55"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "55/55/55"
    print_osc_rgb 17 "55/55/55"
    print_osc_rgb 19 "ed/ed/ed"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#af4947"
    print_linux 2 "#557301"
    print_linux 3 "#876500"
    print_linux 4 "#186daa"
    print_linux 5 "#7b4ecb"
    print_linux 6 "#087767"
    print_linux 7 "#555555"
    print_linux 8 "#848484"
    print_linux 9 "#af4947"
    print_linux 10 "#557301"
    print_linux 11 "#876500"
    print_linux 12 "#186daa"
    print_linux 13 "#7b4ecb"
    print_linux 14 "#087767"
    print_linux 15 "#555555"
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
