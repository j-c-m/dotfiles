#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ollie
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ac/2e/31"
    print_osc4 2 "31/ac/61"
    print_osc4 3 "ac/43/00"
    print_osc4 4 "2d/57/ac"
    print_osc4 5 "b0/85/28"
    print_osc4 6 "1f/a6/ac"
    print_osc4 7 "8a/8e/ac"
    print_osc4 8 "5b/37/25"
    print_osc4 9 "ff/3d/48"
    print_osc4 10 "3b/ff/99"
    print_osc4 11 "ff/5e/1e"
    print_osc4 12 "44/88/ff"
    print_osc4 13 "ff/c2/1d"
    print_osc4 14 "1f/fa/ff"
    print_osc4 15 "5b/6e/a7"

    print_osc_rgb 10 "8a/8d/ae"
    print_osc_rgb 11 "22/21/25"
    print_osc_rgb 12 "8a/8d/ae"
    print_osc_rgb 17 "8a/8d/ae"
    print_osc_rgb 19 "22/21/25"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ac2e31"
    print_linux 2 "#31ac61"
    print_linux 3 "#ac4300"
    print_linux 4 "#2d57ac"
    print_linux 5 "#b08528"
    print_linux 6 "#1fa6ac"
    print_linux 7 "#8a8dae"
    print_linux 8 "#5b3725"
    print_linux 9 "#ff3d48"
    print_linux 10 "#3bff99"
    print_linux 11 "#ff5e1e"
    print_linux 12 "#4488ff"
    print_linux 13 "#ffc21d"
    print_linux 14 "#1ffaff"
    print_linux 15 "#5b6ea7"
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
