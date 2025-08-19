#!/usr/bin/env bash

# Source:   base16
# Theme:    Precious Light Warm
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
    print_osc4 0 "ff/f5/e5"
    print_osc4 1 "b1/47/45"
    print_osc4 2 "55/73/00"
    print_osc4 3 "87/65/00"
    print_osc4 4 "24/6d/a5"
    print_osc4 5 "7a/50/c6"
    print_osc4 6 "0e/77/67"
    print_osc4 7 "4e/53/59"
    print_osc4 8 "7f/80/80"
    print_osc4 9 "b1/47/45"
    print_osc4 10 "55/73/00"
    print_osc4 11 "87/65/00"
    print_osc4 12 "24/6d/a5"
    print_osc4 13 "7a/50/c6"
    print_osc4 14 "0e/77/67"
    print_osc4 15 "4e/53/59"

    print_osc_rgb 10 "4e/53/59"
    print_osc_rgb 11 "ff/f5/e5"
    print_osc_rgb 12 "4e/53/59"
    print_osc_rgb 17 "4e/53/59"
    print_osc_rgb 19 "ec/e4/d6"
}

do_linux() {
    print_linux 0 "#fff5e5"
    print_linux 1 "#b14745"
    print_linux 2 "#557300"
    print_linux 3 "#876500"
    print_linux 4 "#246da5"
    print_linux 5 "#7a50c6"
    print_linux 6 "#0e7767"
    print_linux 7 "#4e5359"
    print_linux 8 "#7f8080"
    print_linux 9 "#b14745"
    print_linux 10 "#557300"
    print_linux 11 "#876500"
    print_linux 12 "#246da5"
    print_linux 13 "#7a50c6"
    print_linux 14 "#0e7767"
    print_linux 15 "#4e5359"
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
