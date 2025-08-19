#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tomorrow
# Author:   unknown
# Variant:  light

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
    print_osc4 1 "c8/28/28"
    print_osc4 2 "71/8c/00"
    print_osc4 3 "ea/b7/00"
    print_osc4 4 "41/71/ae"
    print_osc4 5 "89/59/a8"
    print_osc4 6 "3e/99/9f"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "00/00/00"
    print_osc4 9 "c8/28/28"
    print_osc4 10 "70/8b/00"
    print_osc4 11 "e9/b6/00"
    print_osc4 12 "41/70/ae"
    print_osc4 13 "89/58/a7"
    print_osc4 14 "3d/99/9f"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "4d/4d/4c"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "4c/4c/4c"
    print_osc_rgb 17 "d6/d6/d6"
    print_osc_rgb 19 "4c/4c/4c"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c82828"
    print_linux 2 "#718c00"
    print_linux 3 "#eab700"
    print_linux 4 "#4171ae"
    print_linux 5 "#8959a8"
    print_linux 6 "#3e999f"
    print_linux 7 "#4d4d4c"
    print_linux 8 "#000000"
    print_linux 9 "#c82828"
    print_linux 10 "#708b00"
    print_linux 11 "#e9b600"
    print_linux 12 "#4170ae"
    print_linux 13 "#8958a7"
    print_linux 14 "#3d999f"
    print_linux 15 "#fffefe"
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
