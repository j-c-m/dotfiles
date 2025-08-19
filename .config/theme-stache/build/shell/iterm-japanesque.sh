#!/usr/bin/env bash

# Source:   iterm
# Theme:    Japanesque
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "34/38/35"
    print_osc4 1 "ce/3e/60"
    print_osc4 2 "7b/b7/5b"
    print_osc4 3 "e8/b3/2a"
    print_osc4 4 "4c/99/d3"
    print_osc4 5 "a5/7f/c4"
    print_osc4 6 "38/9a/ac"
    print_osc4 7 "f9/fa/f6"
    print_osc4 8 "58/5a/58"
    print_osc4 9 "d1/8e/a6"
    print_osc4 10 "76/7e/2b"
    print_osc4 11 "77/59/2e"
    print_osc4 12 "13/58/79"
    print_osc4 13 "5f/41/90"
    print_osc4 14 "76/bb/ca"
    print_osc4 15 "b1/b5/ae"

    print_osc_rgb 10 "f7/f6/ec"
    print_osc_rgb 11 "1d/1d/1d"
    print_osc_rgb 12 "ec/cf/4f"
    print_osc_rgb 17 "16/57/76"
    print_osc_rgb 19 "f7/f6/ec"
}

do_linux() {
    print_linux 0 "#343835"
    print_linux 1 "#ce3e60"
    print_linux 2 "#7bb75b"
    print_linux 3 "#e8b32a"
    print_linux 4 "#4c99d3"
    print_linux 5 "#a57fc4"
    print_linux 6 "#389aac"
    print_linux 7 "#f7f6ec"
    print_linux 8 "#585a58"
    print_linux 9 "#d18ea6"
    print_linux 10 "#767e2b"
    print_linux 11 "#77592e"
    print_linux 12 "#135879"
    print_linux 13 "#5f4190"
    print_linux 14 "#76bbca"
    print_linux 15 "#b1b5ae"
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
