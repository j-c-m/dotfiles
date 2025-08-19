#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Suburb
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "1e/20/2f"
    print_osc4 1 "75/86/f5"
    print_osc4 2 "fb/6f/a9"
    print_osc4 3 "ff/b3/d2"
    print_osc4 4 "86/96/fd"
    print_osc4 5 "fb/6f/a9"
    print_osc4 6 "a0/ac/fe"
    print_osc4 7 "87/8b/a6"
    print_osc4 8 "4f/54/72"
    print_osc4 9 "fe/81/b5"
    print_osc4 10 "29/2c/3d"
    print_osc4 11 "44/48/64"
    print_osc4 12 "5b/60/80"
    print_osc4 13 "d2/d8/fe"
    print_osc4 14 "f7/64/a1"
    print_osc4 15 "eb/ed/ff"

    print_osc_rgb 10 "87/8b/a6"
    print_osc_rgb 11 "1e/20/2f"
    print_osc_rgb 12 "d1/47/81"
    print_osc_rgb 17 "87/8b/a6"
    print_osc_rgb 19 "1e/20/2f"
}

do_linux() {
    print_linux 0 "#1e202f"
    print_linux 1 "#7586f5"
    print_linux 2 "#fb6fa9"
    print_linux 3 "#ffb3d2"
    print_linux 4 "#8696fd"
    print_linux 5 "#fb6fa9"
    print_linux 6 "#a0acfe"
    print_linux 7 "#878ba6"
    print_linux 8 "#4f5472"
    print_linux 9 "#fe81b5"
    print_linux 10 "#292c3d"
    print_linux 11 "#444864"
    print_linux 12 "#5b6080"
    print_linux 13 "#d2d8fe"
    print_linux 14 "#f764a1"
    print_linux 15 "#ebedff"
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
