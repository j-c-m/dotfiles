#!/usr/bin/env bash

# Source:   base24
# Theme:    Jellybeans
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "12/12/12"
    print_osc4 1 "e2/73/73"
    print_osc4 2 "93/b9/79"
    print_osc4 3 "b1/d8/f6"
    print_osc4 4 "97/be/dc"
    print_osc4 5 "e1/c0/fa"
    print_osc4 6 "00/98/8e"
    print_osc4 7 "d5/d5/d5"
    print_osc4 8 "c5/c5/c5"
    print_osc4 9 "ff/a1/a1"
    print_osc4 10 "bd/de/ab"
    print_osc4 11 "ff/dc/a0"
    print_osc4 12 "b1/d8/f6"
    print_osc4 13 "fb/da/ff"
    print_osc4 14 "1a/b2/a8"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d5/d5/d5"
    print_osc_rgb 11 "12/12/12"
    print_osc_rgb 12 "d5/d5/d5"
    print_osc_rgb 17 "de/de/de"
    print_osc_rgb 19 "92/92/92"
}

do_linux() {
    print_linux 0 "#121212"
    print_linux 1 "#e27373"
    print_linux 2 "#93b979"
    print_linux 3 "#b1d8f6"
    print_linux 4 "#97bedc"
    print_linux 5 "#e1c0fa"
    print_linux 6 "#00988e"
    print_linux 7 "#d5d5d5"
    print_linux 8 "#c5c5c5"
    print_linux 9 "#ffa1a1"
    print_linux 10 "#bddeab"
    print_linux 11 "#ffdca0"
    print_linux 12 "#b1d8f6"
    print_linux 13 "#fbdaff"
    print_linux 14 "#1ab2a8"
    print_linux 15 "#ffffff"
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
