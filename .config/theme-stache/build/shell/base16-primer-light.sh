#!/usr/bin/env bash

# Source:   base16
# Theme:    Primer Light
# Author:   Jimmy Lin
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
    print_osc4 0 "fa/fb/fc"
    print_osc4 1 "d7/3a/49"
    print_osc4 2 "28/a7/45"
    print_osc4 3 "ff/d3/3d"
    print_osc4 4 "03/66/d6"
    print_osc4 5 "ea/4a/aa"
    print_osc4 6 "79/b8/ff"
    print_osc4 7 "2f/36/3d"
    print_osc4 8 "95/9d/a5"
    print_osc4 9 "d7/3a/49"
    print_osc4 10 "28/a7/45"
    print_osc4 11 "ff/d3/3d"
    print_osc4 12 "03/66/d6"
    print_osc4 13 "ea/4a/aa"
    print_osc4 14 "79/b8/ff"
    print_osc4 15 "1b/1f/23"

    print_osc_rgb 10 "2f/36/3d"
    print_osc_rgb 11 "fa/fb/fc"
    print_osc_rgb 12 "2f/36/3d"
    print_osc_rgb 17 "24/29/2e"
    print_osc_rgb 19 "e1/e4/e8"
}

do_linux() {
    print_linux 0 "#fafbfc"
    print_linux 1 "#d73a49"
    print_linux 2 "#28a745"
    print_linux 3 "#ffd33d"
    print_linux 4 "#0366d6"
    print_linux 5 "#ea4aaa"
    print_linux 6 "#79b8ff"
    print_linux 7 "#2f363d"
    print_linux 8 "#959da5"
    print_linux 9 "#d73a49"
    print_linux 10 "#28a745"
    print_linux 11 "#ffd33d"
    print_linux 12 "#0366d6"
    print_linux 13 "#ea4aaa"
    print_linux 14 "#79b8ff"
    print_linux 15 "#1b1f23"
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
