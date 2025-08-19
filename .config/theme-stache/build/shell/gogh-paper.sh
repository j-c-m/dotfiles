#!/usr/bin/env bash

# Source:   gogh
# Theme:    Paper
# Author:   
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cc/3e/28"
    print_osc4 2 "21/66/09"
    print_osc4 3 "b5/89/00"
    print_osc4 4 "1e/6f/cc"
    print_osc4 5 "5c/21/a5"
    print_osc4 6 "15/8c/86"
    print_osc4 7 "aa/aa/aa"
    print_osc4 8 "55/55/55"
    print_osc4 9 "cc/3e/28"
    print_osc4 10 "21/66/09"
    print_osc4 11 "b5/89/00"
    print_osc4 12 "1e/6f/cc"
    print_osc4 13 "5c/21/a5"
    print_osc4 14 "15/8c/86"
    print_osc4 15 "aa/aa/aa"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "f2/ee/de"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "00/00/00"
    print_osc_rgb 19 "f2/ee/de"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cc3e28"
    print_linux 2 "#216609"
    print_linux 3 "#b58900"
    print_linux 4 "#1e6fcc"
    print_linux 5 "#5c21a5"
    print_linux 6 "#158c86"
    print_linux 7 "#000000"
    print_linux 8 "#555555"
    print_linux 9 "#cc3e28"
    print_linux 10 "#216609"
    print_linux 11 "#b58900"
    print_linux 12 "#1e6fcc"
    print_linux 13 "#5c21a5"
    print_linux 14 "#158c86"
    print_linux 15 "#aaaaaa"
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
