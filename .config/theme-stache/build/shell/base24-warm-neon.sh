#!/usr/bin/env bash

# Source:   base24
# Theme:    Warm Neon
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "3f/3f/3f"
    print_osc4 1 "e2/43/45"
    print_osc4 2 "38/b1/39"
    print_osc4 3 "7a/90/d5"
    print_osc4 4 "42/60/c5"
    print_osc4 5 "f8/1f/fb"
    print_osc4 6 "29/ba/d3"
    print_osc4 7 "dc/c9/ba"
    print_osc4 8 "f2/eb/e6"
    print_osc4 9 "e8/6f/71"
    print_osc4 10 "9b/c0/8f"
    print_osc4 11 "dd/d9/79"
    print_osc4 12 "7a/90/d5"
    print_osc4 13 "f6/74/b9"
    print_osc4 14 "5e/d1/e4"
    print_osc4 15 "d8/c8/bb"

    print_osc_rgb 10 "dc/c9/ba"
    print_osc_rgb 11 "3f/3f/3f"
    print_osc_rgb 12 "dc/c9/ba"
    print_osc_rgb 17 "d0/b8/a3"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#3f3f3f"
    print_linux 1 "#e24345"
    print_linux 2 "#38b139"
    print_linux 3 "#7a90d5"
    print_linux 4 "#4260c5"
    print_linux 5 "#f81ffb"
    print_linux 6 "#29bad3"
    print_linux 7 "#dcc9ba"
    print_linux 8 "#f2ebe6"
    print_linux 9 "#e86f71"
    print_linux 10 "#9bc08f"
    print_linux 11 "#ddd979"
    print_linux 12 "#7a90d5"
    print_linux 13 "#f674b9"
    print_linux 14 "#5ed1e4"
    print_linux 15 "#d8c8bb"
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
