#!/usr/bin/env bash

# Source:   base16
# Theme:    dirtysea
# Author:   Kahlil (Kal) Hodgson
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
    print_osc4 0 "e0/e0/e0"
    print_osc4 1 "84/00/00"
    print_osc4 2 "73/00/73"
    print_osc4 3 "75/5b/00"
    print_osc4 4 "00/73/00"
    print_osc4 5 "00/00/90"
    print_osc4 6 "75/5b/00"
    print_osc4 7 "00/00/00"
    print_osc4 8 "70/70/70"
    print_osc4 9 "84/00/00"
    print_osc4 10 "73/00/73"
    print_osc4 11 "75/5b/00"
    print_osc4 12 "00/73/00"
    print_osc4 13 "00/00/90"
    print_osc4 14 "75/5b/00"
    print_osc4 15 "c4/d9/c4"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "e0/e0/e0"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "f8/f8/f8"
    print_osc_rgb 19 "d0/da/d0"
}

do_linux() {
    print_linux 0 "#e0e0e0"
    print_linux 1 "#840000"
    print_linux 2 "#730073"
    print_linux 3 "#755b00"
    print_linux 4 "#007300"
    print_linux 5 "#000090"
    print_linux 6 "#755b00"
    print_linux 7 "#000000"
    print_linux 8 "#707070"
    print_linux 9 "#840000"
    print_linux 10 "#730073"
    print_linux 11 "#755b00"
    print_linux 12 "#007300"
    print_linux 13 "#000090"
    print_linux 14 "#755b00"
    print_linux 15 "#c4d9c4"
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
