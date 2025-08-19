#!/usr/bin/env bash

# Source:   gogh
# Theme:    Material
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
    print_osc4 0 "07/36/41"
    print_osc4 1 "eb/60/6b"
    print_osc4 2 "c3/e8/8d"
    print_osc4 3 "f7/eb/95"
    print_osc4 4 "80/cb/c3"
    print_osc4 5 "ff/24/90"
    print_osc4 6 "ae/dd/ff"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/2b/36"
    print_osc4 9 "eb/60/6b"
    print_osc4 10 "c3/e8/8d"
    print_osc4 11 "f7/eb/95"
    print_osc4 12 "7d/c6/bf"
    print_osc4 13 "6c/71/c3"
    print_osc4 14 "34/43/4d"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c3/c7/d1"
    print_osc_rgb 11 "1e/28/2c"
    print_osc_rgb 12 "65/7b/83"
    print_osc_rgb 17 "c3/c7/d1"
    print_osc_rgb 19 "1e/28/2c"
}

do_linux() {
    print_linux 0 "#073641"
    print_linux 1 "#eb606b"
    print_linux 2 "#c3e88d"
    print_linux 3 "#f7eb95"
    print_linux 4 "#80cbc3"
    print_linux 5 "#ff2490"
    print_linux 6 "#aeddff"
    print_linux 7 "#c3c7d1"
    print_linux 8 "#002b36"
    print_linux 9 "#eb606b"
    print_linux 10 "#c3e88d"
    print_linux 11 "#f7eb95"
    print_linux 12 "#7dc6bf"
    print_linux 13 "#6c71c3"
    print_linux 14 "#34434d"
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
