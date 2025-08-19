#!/usr/bin/env bash

# Source:   iterm
# Theme:    MaterialDesignColors
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
    print_osc4 0 "43/5a/66"
    print_osc4 1 "fb/38/41"
    print_osc4 2 "5c/f0/9e"
    print_osc4 3 "fe/d0/32"
    print_osc4 4 "36/b6/fe"
    print_osc4 5 "fb/21/6e"
    print_osc4 6 "58/ff/d1"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "a0/b0/b8"
    print_osc4 9 "fc/73/6d"
    print_osc4 10 "ac/f6/be"
    print_osc4 11 "fe/e1/6c"
    print_osc4 12 "6f/ce/fe"
    print_osc4 13 "fc/66/9a"
    print_osc4 14 "99/ff/e5"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "e7/ea/ed"
    print_osc_rgb 11 "1c/25/2a"
    print_osc_rgb 12 "e9/e9/e9"
    print_osc_rgb 17 "4e/69/78"
    print_osc_rgb 19 "e7/ea/ed"
}

do_linux() {
    print_linux 0 "#435a66"
    print_linux 1 "#fb3841"
    print_linux 2 "#5cf09e"
    print_linux 3 "#fed032"
    print_linux 4 "#36b6fe"
    print_linux 5 "#fb216e"
    print_linux 6 "#58ffd1"
    print_linux 7 "#e7eaed"
    print_linux 8 "#a0b0b8"
    print_linux 9 "#fc736d"
    print_linux 10 "#acf6be"
    print_linux 11 "#fee16c"
    print_linux 12 "#6fcefe"
    print_linux 13 "#fc669a"
    print_linux 14 "#99ffe5"
    print_linux 15 "#fffefe"
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
