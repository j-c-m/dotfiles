#!/usr/bin/env bash

# Source:   base24
# Theme:    Nocturnal Winter
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "0d/0d/17"
    print_osc4 1 "f1/2d/52"
    print_osc4 2 "08/cd/7d"
    print_osc4 3 "60/95/fe"
    print_osc4 4 "30/81/df"
    print_osc4 5 "fe/2a/6c"
    print_osc4 6 "09/c8/7a"
    print_osc4 7 "dc/dc/dc"
    print_osc4 8 "9e/9e/9e"
    print_osc4 9 "f1/6c/85"
    print_osc4 10 "0a/e7/8d"
    print_osc4 11 "fe/fb/67"
    print_osc4 12 "60/95/fe"
    print_osc4 13 "ff/78/a2"
    print_osc4 14 "0a/e7/8d"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "dc/dc/dc"
    print_osc_rgb 11 "0d/0d/17"
    print_osc_rgb 12 "dc/dc/dc"
    print_osc_rgb 17 "fb/fb/fb"
    print_osc_rgb 19 "4c/4c/4c"
}

do_linux() {
    print_linux 0 "#0d0d17"
    print_linux 1 "#f12d52"
    print_linux 2 "#08cd7d"
    print_linux 3 "#6095fe"
    print_linux 4 "#3081df"
    print_linux 5 "#fe2a6c"
    print_linux 6 "#09c87a"
    print_linux 7 "#dcdcdc"
    print_linux 8 "#9e9e9e"
    print_linux 9 "#f16c85"
    print_linux 10 "#0ae78d"
    print_linux 11 "#fefb67"
    print_linux 12 "#6095fe"
    print_linux 13 "#ff78a2"
    print_linux 14 "#0ae78d"
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
