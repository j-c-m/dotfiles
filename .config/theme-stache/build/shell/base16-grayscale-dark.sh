#!/usr/bin/env bash

# Source:   base16
# Theme:    Grayscale Dark
# Author:   Alexandre Gavioli (https://github.com/Alexx2/)
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
    print_osc4 0 "10/10/10"
    print_osc4 1 "7c/7c/7c"
    print_osc4 2 "8e/8e/8e"
    print_osc4 3 "a0/a0/a0"
    print_osc4 4 "68/68/68"
    print_osc4 5 "74/74/74"
    print_osc4 6 "86/86/86"
    print_osc4 7 "b9/b9/b9"
    print_osc4 8 "52/52/52"
    print_osc4 9 "7c/7c/7c"
    print_osc4 10 "8e/8e/8e"
    print_osc4 11 "a0/a0/a0"
    print_osc4 12 "68/68/68"
    print_osc4 13 "74/74/74"
    print_osc4 14 "86/86/86"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "b9/b9/b9"
    print_osc_rgb 11 "10/10/10"
    print_osc_rgb 12 "b9/b9/b9"
    print_osc_rgb 17 "e3/e3/e3"
    print_osc_rgb 19 "25/25/25"
}

do_linux() {
    print_linux 0 "#101010"
    print_linux 1 "#7c7c7c"
    print_linux 2 "#8e8e8e"
    print_linux 3 "#a0a0a0"
    print_linux 4 "#686868"
    print_linux 5 "#747474"
    print_linux 6 "#868686"
    print_linux 7 "#b9b9b9"
    print_linux 8 "#525252"
    print_linux 9 "#7c7c7c"
    print_linux 10 "#8e8e8e"
    print_linux 11 "#a0a0a0"
    print_linux 12 "#686868"
    print_linux 13 "#747474"
    print_linux 14 "#868686"
    print_linux 15 "#f7f7f7"
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
