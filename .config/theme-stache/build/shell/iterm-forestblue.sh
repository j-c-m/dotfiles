#!/usr/bin/env bash

# Source:   iterm
# Theme:    ForestBlue
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
    print_osc4 0 "33/33/33"
    print_osc4 1 "f8/81/8e"
    print_osc4 2 "92/d3/a2"
    print_osc4 3 "1a/8d/63"
    print_osc4 4 "8e/d0/ce"
    print_osc4 5 "5e/46/8c"
    print_osc4 6 "31/65/8c"
    print_osc4 7 "e2/d8/cd"
    print_osc4 8 "3d/3d/3d"
    print_osc4 9 "fb/3d/66"
    print_osc4 10 "6b/b4/8d"
    print_osc4 11 "2f/c8/59"
    print_osc4 12 "39/a7/a2"
    print_osc4 13 "7e/62/b3"
    print_osc4 14 "60/96/bf"
    print_osc4 15 "e2/d8/cd"

    print_osc_rgb 10 "e2/d8/cd"
    print_osc_rgb 11 "05/15/19"
    print_osc_rgb 12 "9d/9e/ca"
    print_osc_rgb 17 "4d/4d/4d"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#f8818e"
    print_linux 2 "#92d3a2"
    print_linux 3 "#1a8d63"
    print_linux 4 "#8ed0ce"
    print_linux 5 "#5e468c"
    print_linux 6 "#31658c"
    print_linux 7 "#e2d8cd"
    print_linux 8 "#3d3d3d"
    print_linux 9 "#fb3d66"
    print_linux 10 "#6bb48d"
    print_linux 11 "#2fc859"
    print_linux 12 "#39a7a2"
    print_linux 13 "#7e62b3"
    print_linux 14 "#6096bf"
    print_linux 15 "#e2d8cd"
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
