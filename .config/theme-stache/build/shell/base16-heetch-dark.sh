#!/usr/bin/env bash

# Source:   base16
# Theme:    Heetch Dark
# Author:   Geoffrey Teale (tealeg@gmail.com)
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
    print_osc4 0 "19/01/34"
    print_osc4 1 "27/d9/d5"
    print_osc4 2 "c3/36/78"
    print_osc4 3 "8f/6c/97"
    print_osc4 4 "bd/01/52"
    print_osc4 5 "82/03/4c"
    print_osc4 6 "f8/00/59"
    print_osc4 7 "bd/b6/c5"
    print_osc4 8 "7b/6d/8b"
    print_osc4 9 "27/d9/d5"
    print_osc4 10 "c3/36/78"
    print_osc4 11 "8f/6c/97"
    print_osc4 12 "bd/01/52"
    print_osc4 13 "82/03/4c"
    print_osc4 14 "f8/00/59"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "bd/b6/c5"
    print_osc_rgb 11 "19/01/34"
    print_osc_rgb 12 "bd/b6/c5"
    print_osc_rgb 17 "de/da/e2"
    print_osc_rgb 19 "39/25/51"
}

do_linux() {
    print_linux 0 "#190134"
    print_linux 1 "#27d9d5"
    print_linux 2 "#c33678"
    print_linux 3 "#8f6c97"
    print_linux 4 "#bd0152"
    print_linux 5 "#82034c"
    print_linux 6 "#f80059"
    print_linux 7 "#bdb6c5"
    print_linux 8 "#7b6d8b"
    print_linux 9 "#27d9d5"
    print_linux 10 "#c33678"
    print_linux 11 "#8f6c97"
    print_linux 12 "#bd0152"
    print_linux 13 "#82034c"
    print_linux 14 "#f80059"
    print_linux 15 "#feffff"
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
