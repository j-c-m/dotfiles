#!/usr/bin/env bash

# Source:   base24
# Theme:    Catppuccin Frappe
# Author:   https://github.com/catppuccin/catppuccin
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
    print_osc4 0 "30/34/46"
    print_osc4 1 "e7/82/84"
    print_osc4 2 "a6/d1/89"
    print_osc4 3 "e5/c8/90"
    print_osc4 4 "8c/aa/ee"
    print_osc4 5 "ca/9e/e6"
    print_osc4 6 "81/c8/be"
    print_osc4 7 "c6/d0/f5"
    print_osc4 8 "51/57/6d"
    print_osc4 9 "ea/99/9c"
    print_osc4 10 "a6/d1/89"
    print_osc4 11 "f2/d5/cf"
    print_osc4 12 "85/c1/dc"
    print_osc4 13 "f4/b8/e4"
    print_osc4 14 "99/d1/db"
    print_osc4 15 "ba/bb/f1"

    print_osc_rgb 10 "c6/d0/f5"
    print_osc_rgb 11 "30/34/46"
    print_osc_rgb 12 "c6/d0/f5"
    print_osc_rgb 17 "f2/d5/cf"
    print_osc_rgb 19 "29/2c/3c"
}

do_linux() {
    print_linux 0 "#303446"
    print_linux 1 "#e78284"
    print_linux 2 "#a6d189"
    print_linux 3 "#e5c890"
    print_linux 4 "#8caaee"
    print_linux 5 "#ca9ee6"
    print_linux 6 "#81c8be"
    print_linux 7 "#c6d0f5"
    print_linux 8 "#51576d"
    print_linux 9 "#ea999c"
    print_linux 10 "#a6d189"
    print_linux 11 "#f2d5cf"
    print_linux 12 "#85c1dc"
    print_linux 13 "#f4b8e4"
    print_linux 14 "#99d1db"
    print_linux 15 "#babbf1"
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
