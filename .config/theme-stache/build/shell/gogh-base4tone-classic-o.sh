#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic O
# Author:   
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
    print_osc4 0 "1a/1d/23"
    print_osc4 1 "a2/4a/d9"
    print_osc4 2 "0d/9c/89"
    print_osc4 3 "1e/d2/ba"
    print_osc4 4 "74/a8/fb"
    print_osc4 5 "94/88/f2"
    print_osc4 6 "1b/bb/a6"
    print_osc4 7 "e7/ea/ee"
    print_osc4 8 "07/09/0d"
    print_osc4 9 "c2/7e/ed"
    print_osc4 10 "2f/da/c3"
    print_osc4 11 "93/ec/e0"
    print_osc4 12 "c7/dc/ff"
    print_osc4 13 "ab/a1/f7"
    print_osc4 14 "c2/d9/ff"
    print_osc4 15 "f6/f7/f9"

    print_osc_rgb 10 "89/95/a9"
    print_osc_rgb 11 "1a/1d/23"
    print_osc_rgb 12 "6d/88/84"
    print_osc_rgb 17 "89/95/a9"
    print_osc_rgb 19 "1a/1d/23"
}

do_linux() {
    print_linux 0 "#1a1d23"
    print_linux 1 "#a24ad9"
    print_linux 2 "#0d9c89"
    print_linux 3 "#1ed2ba"
    print_linux 4 "#74a8fb"
    print_linux 5 "#9488f2"
    print_linux 6 "#1bbba6"
    print_linux 7 "#8995a9"
    print_linux 8 "#07090d"
    print_linux 9 "#c27eed"
    print_linux 10 "#2fdac3"
    print_linux 11 "#93ece0"
    print_linux 12 "#c7dcff"
    print_linux 13 "#aba1f7"
    print_linux 14 "#c2d9ff"
    print_linux 15 "#f6f7f9"
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
