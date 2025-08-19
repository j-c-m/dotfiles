#!/usr/bin/env bash

# Source:   gogh
# Theme:    Adventure Time
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
    print_osc4 0 "05/04/04"
    print_osc4 1 "bd/00/13"
    print_osc4 2 "4a/b1/18"
    print_osc4 3 "e7/74/1e"
    print_osc4 4 "0f/4a/c6"
    print_osc4 5 "66/59/93"
    print_osc4 6 "70/a5/98"
    print_osc4 7 "f8/dc/c0"
    print_osc4 8 "4e/7c/bf"
    print_osc4 9 "fc/5f/5a"
    print_osc4 10 "9e/ff/6e"
    print_osc4 11 "ef/c1/1a"
    print_osc4 12 "19/97/c6"
    print_osc4 13 "9b/59/53"
    print_osc4 14 "c8/fa/f4"
    print_osc4 15 "f6/f5/fb"

    print_osc_rgb 10 "f8/dc/c0"
    print_osc_rgb 11 "1f/1d/45"
    print_osc_rgb 12 "f8/dc/c0"
    print_osc_rgb 17 "f8/dc/c0"
    print_osc_rgb 19 "1f/1d/45"
}

do_linux() {
    print_linux 0 "#050404"
    print_linux 1 "#bd0013"
    print_linux 2 "#4ab118"
    print_linux 3 "#e7741e"
    print_linux 4 "#0f4ac6"
    print_linux 5 "#665993"
    print_linux 6 "#70a598"
    print_linux 7 "#f8dcc0"
    print_linux 8 "#4e7cbf"
    print_linux 9 "#fc5f5a"
    print_linux 10 "#9eff6e"
    print_linux 11 "#efc11a"
    print_linux 12 "#1997c6"
    print_linux 13 "#9b5953"
    print_linux 14 "#c8faf4"
    print_linux 15 "#f6f5fb"
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
