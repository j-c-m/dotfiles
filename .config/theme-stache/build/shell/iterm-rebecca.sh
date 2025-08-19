#!/usr/bin/env bash

# Source:   iterm
# Theme:    rebecca
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
    print_osc4 0 "12/13/1d"
    print_osc4 1 "dd/76/55"
    print_osc4 2 "04/db/b4"
    print_osc4 3 "f2/e7/b7"
    print_osc4 4 "7a/a5/ff"
    print_osc4 5 "be/9b/f8"
    print_osc4 6 "56/d3/c1"
    print_osc4 7 "e3/e2/e8"
    print_osc4 8 "66/66/99"
    print_osc4 9 "ff/91/cd"
    print_osc4 10 "00/e9/c0"
    print_osc4 11 "fe/fc/a8"
    print_osc4 12 "69/bf/fa"
    print_osc4 13 "c0/7f/f8"
    print_osc4 14 "8b/fc/e1"
    print_osc4 15 "f3/f2/f8"

    print_osc_rgb 10 "e7/e6/ec"
    print_osc_rgb 11 "29/2a/44"
    print_osc_rgb 12 "b7/9b/f8"
    print_osc_rgb 17 "66/33/99"
    print_osc_rgb 19 "f3/f2/f8"
}

do_linux() {
    print_linux 0 "#12131d"
    print_linux 1 "#dd7655"
    print_linux 2 "#04dbb4"
    print_linux 3 "#f2e7b7"
    print_linux 4 "#7aa5ff"
    print_linux 5 "#be9bf8"
    print_linux 6 "#56d3c1"
    print_linux 7 "#e7e6ec"
    print_linux 8 "#666699"
    print_linux 9 "#ff91cd"
    print_linux 10 "#00e9c0"
    print_linux 11 "#fefca8"
    print_linux 12 "#69bffa"
    print_linux 13 "#c07ff8"
    print_linux 14 "#8bfce1"
    print_linux 15 "#f3f2f8"
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
