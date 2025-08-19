#!/usr/bin/env bash

# Source:   iterm
# Theme:    synthwave-everything
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "fe/fe/fe"
    print_osc4 1 "f9/7e/72"
    print_osc4 2 "72/f1/b8"
    print_osc4 3 "fe/de/5d"
    print_osc4 4 "6d/77/b3"
    print_osc4 5 "c7/92/ea"
    print_osc4 6 "f7/72/e0"
    print_osc4 7 "fe/fe/fe"
    print_osc4 8 "fe/fe/fe"
    print_osc4 9 "f8/84/14"
    print_osc4 10 "72/f1/b8"
    print_osc4 11 "ff/f9/51"
    print_osc4 12 "36/f9/f6"
    print_osc4 13 "e1/ac/ff"
    print_osc4 14 "f9/2a/ad"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "f0/ef/f1"
    print_osc_rgb 11 "2a/21/39"
    print_osc_rgb 12 "72/f1/b8"
    print_osc_rgb 17 "18/15/21"
    print_osc_rgb 19 "f0/ef/f1"
}

do_linux() {
    print_linux 0 "#fefefe"
    print_linux 1 "#f97e72"
    print_linux 2 "#72f1b8"
    print_linux 3 "#fede5d"
    print_linux 4 "#6d77b3"
    print_linux 5 "#c792ea"
    print_linux 6 "#f772e0"
    print_linux 7 "#f0eff1"
    print_linux 8 "#fefefe"
    print_linux 9 "#f88414"
    print_linux 10 "#72f1b8"
    print_linux 11 "#fff951"
    print_linux 12 "#36f9f6"
    print_linux 13 "#e1acff"
    print_linux 14 "#f92aad"
    print_linux 15 "#fefefe"
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
