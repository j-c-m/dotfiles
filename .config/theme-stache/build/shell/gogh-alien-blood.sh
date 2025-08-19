#!/usr/bin/env bash

# Source:   gogh
# Theme:    Alien Blood
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
    print_osc4 0 "11/26/16"
    print_osc4 1 "7f/2b/27"
    print_osc4 2 "2f/7e/25"
    print_osc4 3 "71/7f/24"
    print_osc4 4 "2f/6a/7f"
    print_osc4 5 "47/58/7f"
    print_osc4 6 "32/7f/77"
    print_osc4 7 "64/7d/75"
    print_osc4 8 "3c/48/12"
    print_osc4 9 "e0/80/09"
    print_osc4 10 "18/e0/00"
    print_osc4 11 "bd/e0/00"
    print_osc4 12 "00/aa/e0"
    print_osc4 13 "00/58/e0"
    print_osc4 14 "00/e0/c4"
    print_osc4 15 "73/fa/91"

    print_osc_rgb 10 "63/7d/75"
    print_osc_rgb 11 "0f/16/10"
    print_osc_rgb 12 "63/7d/75"
    print_osc_rgb 17 "63/7d/75"
    print_osc_rgb 19 "0f/16/10"
}

do_linux() {
    print_linux 0 "#112616"
    print_linux 1 "#7f2b27"
    print_linux 2 "#2f7e25"
    print_linux 3 "#717f24"
    print_linux 4 "#2f6a7f"
    print_linux 5 "#47587f"
    print_linux 6 "#327f77"
    print_linux 7 "#637d75"
    print_linux 8 "#3c4812"
    print_linux 9 "#e08009"
    print_linux 10 "#18e000"
    print_linux 11 "#bde000"
    print_linux 12 "#00aae0"
    print_linux 13 "#0058e0"
    print_linux 14 "#00e0c4"
    print_linux 15 "#73fa91"
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
