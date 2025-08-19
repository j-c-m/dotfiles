#!/usr/bin/env bash

# Source:   iterm
# Theme:    Smyck
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "b7/41/31"
    print_osc4 2 "7d/a9/00"
    print_osc4 3 "c4/a4/00"
    print_osc4 4 "62/a3/c4"
    print_osc4 5 "b9/8a/cc"
    print_osc4 6 "20/73/83"
    print_osc4 7 "a0/a0/a0"
    print_osc4 8 "7a/7a/7a"
    print_osc4 9 "d6/83/7b"
    print_osc4 10 "c4/f0/36"
    print_osc4 11 "fe/e1/4d"
    print_osc4 12 "8d/cf/f0"
    print_osc4 13 "f7/99/ff"
    print_osc4 14 "69/d9/cf"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "f7/f7/f7"
    print_osc_rgb 11 "1b/1b/1b"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "20/73/83"
    print_osc_rgb 19 "f7/f7/f7"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#b74131"
    print_linux 2 "#7da900"
    print_linux 3 "#c4a400"
    print_linux 4 "#62a3c4"
    print_linux 5 "#b98acc"
    print_linux 6 "#207383"
    print_linux 7 "#f7f7f7"
    print_linux 8 "#7a7a7a"
    print_linux 9 "#d6837b"
    print_linux 10 "#c4f036"
    print_linux 11 "#fee14d"
    print_linux 12 "#8dcff0"
    print_linux 13 "#f799ff"
    print_linux 14 "#69d9cf"
    print_linux 15 "#f7f7f7"
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
