#!/usr/bin/env bash

# Source:   gogh
# Theme:    Lavandula
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
    print_osc4 0 "23/00/46"
    print_osc4 1 "7d/16/25"
    print_osc4 2 "33/7e/6f"
    print_osc4 3 "7f/6f/49"
    print_osc4 4 "4f/4a/7f"
    print_osc4 5 "5a/3f/7f"
    print_osc4 6 "58/77/7f"
    print_osc4 7 "73/6e/7d"
    print_osc4 8 "37/2d/46"
    print_osc4 9 "e0/51/67"
    print_osc4 10 "52/e0/c4"
    print_osc4 11 "e0/c3/86"
    print_osc4 12 "8e/87/e0"
    print_osc4 13 "a7/76/e0"
    print_osc4 14 "9a/d4/e0"
    print_osc4 15 "8c/91/fa"

    print_osc_rgb 10 "73/6e/7d"
    print_osc_rgb 11 "05/00/14"
    print_osc_rgb 12 "73/6e/7d"
    print_osc_rgb 17 "73/6e/7d"
    print_osc_rgb 19 "05/00/14"
}

do_linux() {
    print_linux 0 "#230046"
    print_linux 1 "#7d1625"
    print_linux 2 "#337e6f"
    print_linux 3 "#7f6f49"
    print_linux 4 "#4f4a7f"
    print_linux 5 "#5a3f7f"
    print_linux 6 "#58777f"
    print_linux 7 "#736e7d"
    print_linux 8 "#372d46"
    print_linux 9 "#e05167"
    print_linux 10 "#52e0c4"
    print_linux 11 "#e0c386"
    print_linux 12 "#8e87e0"
    print_linux 13 "#a776e0"
    print_linux 14 "#9ad4e0"
    print_linux 15 "#8c91fa"
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
