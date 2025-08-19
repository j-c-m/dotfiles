#!/usr/bin/env bash

# Source:   base16
# Theme:    Heetch Light
# Author:   Geoffrey Teale (tealeg@gmail.com)
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
    print_osc4 0 "fe/ff/ff"
    print_osc4 1 "27/d9/d5"
    print_osc4 2 "f8/00/59"
    print_osc4 3 "5b/a2/b6"
    print_osc4 4 "47/f9/f5"
    print_osc4 5 "bd/01/52"
    print_osc4 6 "c3/36/78"
    print_osc4 7 "5a/49/6e"
    print_osc4 8 "9c/92/a8"
    print_osc4 9 "27/d9/d5"
    print_osc4 10 "f8/00/59"
    print_osc4 11 "5b/a2/b6"
    print_osc4 12 "47/f9/f5"
    print_osc4 13 "bd/01/52"
    print_osc4 14 "c3/36/78"
    print_osc4 15 "19/01/34"

    print_osc_rgb 10 "5a/49/6e"
    print_osc_rgb 11 "fe/ff/ff"
    print_osc_rgb 12 "5a/49/6e"
    print_osc_rgb 17 "47/05/46"
    print_osc_rgb 19 "39/25/51"
}

do_linux() {
    print_linux 0 "#feffff"
    print_linux 1 "#27d9d5"
    print_linux 2 "#f80059"
    print_linux 3 "#5ba2b6"
    print_linux 4 "#47f9f5"
    print_linux 5 "#bd0152"
    print_linux 6 "#c33678"
    print_linux 7 "#5a496e"
    print_linux 8 "#9c92a8"
    print_linux 9 "#27d9d5"
    print_linux 10 "#f80059"
    print_linux 11 "#5ba2b6"
    print_linux 12 "#47f9f5"
    print_linux 13 "#bd0152"
    print_linux 14 "#c33678"
    print_linux 15 "#190134"
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
