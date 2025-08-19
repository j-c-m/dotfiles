#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic L
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
    print_osc4 0 "1b/22/21"
    print_osc4 1 "76/67/e4"
    print_osc4 2 "0d/a5/1f"
    print_osc4 3 "2b/da/3f"
    print_osc4 4 "1c/c4/ae"
    print_osc4 5 "65/9e/fb"
    print_osc4 6 "22/bf/34"
    print_osc4 7 "e8/ee/ed"
    print_osc4 8 "07/0d/0c"
    print_osc4 9 "a0/95/f3"
    print_osc4 10 "3c/dd/4f"
    print_osc4 11 "97/ed/a1"
    print_osc4 12 "ad/f0/e7"
    print_osc4 13 "88/b4/fc"
    print_osc4 14 "93/ec/e0"
    print_osc4 15 "f6/f9/f8"

    print_osc_rgb 10 "8e/a4/a1"
    print_osc_rgb 11 "1b/22/21"
    print_osc_rgb 12 "74/81/76"
    print_osc_rgb 17 "8e/a4/a1"
    print_osc_rgb 19 "1b/22/21"
}

do_linux() {
    print_linux 0 "#1b2221"
    print_linux 1 "#7667e4"
    print_linux 2 "#0da51f"
    print_linux 3 "#2bda3f"
    print_linux 4 "#1cc4ae"
    print_linux 5 "#659efb"
    print_linux 6 "#22bf34"
    print_linux 7 "#8ea4a1"
    print_linux 8 "#070d0c"
    print_linux 9 "#a095f3"
    print_linux 10 "#3cdd4f"
    print_linux 11 "#97eda1"
    print_linux 12 "#adf0e7"
    print_linux 13 "#88b4fc"
    print_linux 14 "#93ece0"
    print_linux 15 "#f6f9f8"
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
