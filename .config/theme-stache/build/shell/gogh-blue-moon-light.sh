#!/usr/bin/env bash

# Source:   gogh
# Theme:    Blue Moon Light
# Author:   kyazdani42 (https://github.com/kyazdani42/blue-moon)
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
    print_osc4 0 "29/2d/3e"
    print_osc4 1 "d0/61/79"
    print_osc4 2 "d0/e7/d0"
    print_osc4 3 "cf/cf/bf"
    print_osc4 4 "95/9d/cb"
    print_osc4 5 "a9/a3/db"
    print_osc4 6 "89/bb/dd"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "29/2d/3e"
    print_osc4 9 "d0/61/79"
    print_osc4 10 "d0/e7/d0"
    print_osc4 11 "cf/cf/bf"
    print_osc4 12 "95/9d/cb"
    print_osc4 13 "a9/a3/db"
    print_osc4 14 "89/bb/dd"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "fb/fb/fb"
    print_osc_rgb 11 "32/37/4d"
    print_osc_rgb 12 "fb/fb/fb"
    print_osc_rgb 17 "fb/fb/fb"
    print_osc_rgb 19 "32/37/4d"
}

do_linux() {
    print_linux 0 "#292d3e"
    print_linux 1 "#d06179"
    print_linux 2 "#d0e7d0"
    print_linux 3 "#cfcfbf"
    print_linux 4 "#959dcb"
    print_linux 5 "#a9a3db"
    print_linux 6 "#89bbdd"
    print_linux 7 "#fbfbfb"
    print_linux 8 "#292d3e"
    print_linux 9 "#d06179"
    print_linux 10 "#d0e7d0"
    print_linux 11 "#cfcfbf"
    print_linux 12 "#959dcb"
    print_linux 13 "#a9a3db"
    print_linux 14 "#89bbdd"
    print_linux 15 "#ffffff"
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
