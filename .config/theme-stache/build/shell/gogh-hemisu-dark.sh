#!/usr/bin/env bash

# Source:   gogh
# Theme:    Hemisu Dark
# Author:   
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
    print_osc4 0 "44/44/44"
    print_osc4 1 "ff/00/54"
    print_osc4 2 "b1/d6/30"
    print_osc4 3 "9d/89/5e"
    print_osc4 4 "67/be/e3"
    print_osc4 5 "b5/76/bc"
    print_osc4 6 "56/9a/9f"
    print_osc4 7 "ed/ed/ed"
    print_osc4 8 "77/77/77"
    print_osc4 9 "d6/5e/75"
    print_osc4 10 "ba/ff/aa"
    print_osc4 11 "ec/e1/c8"
    print_osc4 12 "9f/d3/e5"
    print_osc4 13 "de/b3/df"
    print_osc4 14 "b6/e0/e5"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ba/ff/aa"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#444444"
    print_linux 1 "#ff0054"
    print_linux 2 "#b1d630"
    print_linux 3 "#9d895e"
    print_linux 4 "#67bee3"
    print_linux 5 "#b576bc"
    print_linux 6 "#569a9f"
    print_linux 7 "#ffffff"
    print_linux 8 "#777777"
    print_linux 9 "#d65e75"
    print_linux 10 "#baffaa"
    print_linux 11 "#ece1c8"
    print_linux 12 "#9fd3e5"
    print_linux 13 "#deb3df"
    print_linux 14 "#b6e0e5"
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
