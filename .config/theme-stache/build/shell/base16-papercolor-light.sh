#!/usr/bin/env bash

# Source:   base16
# Theme:    PaperColor Light
# Author:   Jon Leopard (http://github.com/jonleopard), based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "ee/ee/ee"
    print_osc4 1 "bc/bc/bc"
    print_osc4 2 "87/00/af"
    print_osc4 3 "d7/00/87"
    print_osc4 4 "d7/5f/00"
    print_osc4 5 "00/5f/af"
    print_osc4 6 "d7/5f/00"
    print_osc4 7 "44/44/44"
    print_osc4 8 "5f/87/00"
    print_osc4 9 "bc/bc/bc"
    print_osc4 10 "87/00/af"
    print_osc4 11 "d7/00/87"
    print_osc4 12 "d7/5f/00"
    print_osc4 13 "00/5f/af"
    print_osc4 14 "d7/5f/00"
    print_osc4 15 "87/87/87"

    print_osc_rgb 10 "44/44/44"
    print_osc_rgb 11 "ee/ee/ee"
    print_osc_rgb 12 "44/44/44"
    print_osc_rgb 17 "00/5f/87"
    print_osc_rgb 19 "af/00/00"
}

do_linux() {
    print_linux 0 "#eeeeee"
    print_linux 1 "#bcbcbc"
    print_linux 2 "#8700af"
    print_linux 3 "#d70087"
    print_linux 4 "#d75f00"
    print_linux 5 "#005faf"
    print_linux 6 "#d75f00"
    print_linux 7 "#444444"
    print_linux 8 "#5f8700"
    print_linux 9 "#bcbcbc"
    print_linux 10 "#8700af"
    print_linux 11 "#d70087"
    print_linux 12 "#d75f00"
    print_linux 13 "#005faf"
    print_linux 14 "#d75f00"
    print_linux 15 "#878787"
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
