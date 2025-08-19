#!/usr/bin/env bash

# Source:   gogh
# Theme:    Rosé Pine Moon
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
    print_osc4 0 "39/35/52"
    print_osc4 1 "eb/6f/92"
    print_osc4 2 "9c/cf/d8"
    print_osc4 3 "f6/c1/77"
    print_osc4 4 "3e/8f/b0"
    print_osc4 5 "c4/a7/e7"
    print_osc4 6 "ea/9a/97"
    print_osc4 7 "e0/de/f4"
    print_osc4 8 "6e/6a/86"
    print_osc4 9 "eb/6f/92"
    print_osc4 10 "9c/cf/d8"
    print_osc4 11 "f6/c1/77"
    print_osc4 12 "3e/8f/b0"
    print_osc4 13 "c4/a7/e7"
    print_osc4 14 "ea/9a/97"
    print_osc4 15 "e0/de/f4"

    print_osc_rgb 10 "e0/de/f4"
    print_osc_rgb 11 "23/21/36"
    print_osc_rgb 12 "e0/de/f4"
    print_osc_rgb 17 "e0/de/f4"
    print_osc_rgb 19 "23/21/36"
}

do_linux() {
    print_linux 0 "#393552"
    print_linux 1 "#eb6f92"
    print_linux 2 "#9ccfd8"
    print_linux 3 "#f6c177"
    print_linux 4 "#3e8fb0"
    print_linux 5 "#c4a7e7"
    print_linux 6 "#ea9a97"
    print_linux 7 "#e0def4"
    print_linux 8 "#6e6a86"
    print_linux 9 "#eb6f92"
    print_linux 10 "#9ccfd8"
    print_linux 11 "#f6c177"
    print_linux 12 "#3e8fb0"
    print_linux 13 "#c4a7e7"
    print_linux 14 "#ea9a97"
    print_linux 15 "#e0def4"
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
