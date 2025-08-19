#!/usr/bin/env bash

# Source:   gogh
# Theme:    City Lights
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
    print_osc4 0 "41/50/5e"
    print_osc4 1 "d9/54/68"
    print_osc4 2 "8b/d4/9c"
    print_osc4 3 "eb/bf/83"
    print_osc4 4 "53/9a/fc"
    print_osc4 5 "b6/2d/65"
    print_osc4 6 "70/e1/e8"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "41/50/5e"
    print_osc4 9 "d9/54/68"
    print_osc4 10 "8b/d4/9c"
    print_osc4 11 "eb/bf/83"
    print_osc4 12 "53/9a/fc"
    print_osc4 13 "b6/2d/65"
    print_osc4 14 "70/e1/e8"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "17/1d/23"
    print_osc_rgb 12 "00/8b/94"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "17/1d/23"
}

do_linux() {
    print_linux 0 "#41505e"
    print_linux 1 "#d95468"
    print_linux 2 "#8bd49c"
    print_linux 3 "#ebbf83"
    print_linux 4 "#539afc"
    print_linux 5 "#b62d65"
    print_linux 6 "#70e1e8"
    print_linux 7 "#ffffff"
    print_linux 8 "#41505e"
    print_linux 9 "#d95468"
    print_linux 10 "#8bd49c"
    print_linux 11 "#ebbf83"
    print_linux 12 "#539afc"
    print_linux 13 "#b62d65"
    print_linux 14 "#70e1e8"
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
