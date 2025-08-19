#!/usr/bin/env bash

# Source:   base24
# Theme:    One Black
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "e0/55/61"
    print_osc4 2 "8c/c2/65"
    print_osc4 3 "e6/b9/65"
    print_osc4 4 "4a/a5/f0"
    print_osc4 5 "c1/62/de"
    print_osc4 6 "42/b3/c2"
    print_osc4 7 "ab/b2/bf"
    print_osc4 8 "54/58/62"
    print_osc4 9 "ff/61/6e"
    print_osc4 10 "a5/e0/75"
    print_osc4 11 "f0/a4/5d"
    print_osc4 12 "4d/c4/ff"
    print_osc4 13 "de/73/ff"
    print_osc4 14 "4c/d1/e0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ab/b2/bf"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ab/b2/bf"
    print_osc_rgb 17 "e6/e6/e6"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e05561"
    print_linux 2 "#8cc265"
    print_linux 3 "#e6b965"
    print_linux 4 "#4aa5f0"
    print_linux 5 "#c162de"
    print_linux 6 "#42b3c2"
    print_linux 7 "#abb2bf"
    print_linux 8 "#545862"
    print_linux 9 "#ff616e"
    print_linux 10 "#a5e075"
    print_linux 11 "#f0a45d"
    print_linux 12 "#4dc4ff"
    print_linux 13 "#de73ff"
    print_linux 14 "#4cd1e0"
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
