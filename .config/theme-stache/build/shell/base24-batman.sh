#!/usr/bin/env bash

# Source:   base24
# Theme:    Batman
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "1b/1d/1e"
    print_osc4 1 "e6/db/43"
    print_osc4 2 "c8/be/46"
    print_osc4 3 "90/94/95"
    print_osc4 4 "73/70/74"
    print_osc4 5 "73/72/71"
    print_osc4 6 "61/5f/5e"
    print_osc4 7 "a7/a8/a3"
    print_osc4 8 "6d/6f/6e"
    print_osc4 9 "ff/f6/8d"
    print_osc4 10 "ff/f2/7c"
    print_osc4 11 "fe/ed/6c"
    print_osc4 12 "90/94/95"
    print_osc4 13 "9a/99/9d"
    print_osc4 14 "a2/a2/a5"
    print_osc4 15 "da/da/d5"

    print_osc_rgb 10 "a7/a8/a3"
    print_osc_rgb 11 "1b/1d/1e"
    print_osc_rgb 12 "a7/a8/a3"
    print_osc_rgb 17 "c5/c5/be"
    print_osc_rgb 19 "1b/1d/1e"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#e6db43"
    print_linux 2 "#c8be46"
    print_linux 3 "#909495"
    print_linux 4 "#737074"
    print_linux 5 "#737271"
    print_linux 6 "#615f5e"
    print_linux 7 "#a7a8a3"
    print_linux 8 "#6d6f6e"
    print_linux 9 "#fff68d"
    print_linux 10 "#fff27c"
    print_linux 11 "#feed6c"
    print_linux 12 "#909495"
    print_linux 13 "#9a999d"
    print_linux 14 "#a2a2a5"
    print_linux 15 "#dadad5"
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
