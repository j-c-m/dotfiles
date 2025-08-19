#!/usr/bin/env bash

# Source:   gogh
# Theme:    Frontend Galaxy
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "f9/55/5f"
    print_osc4 2 "21/b0/89"
    print_osc4 3 "fe/f0/2a"
    print_osc4 4 "58/9d/f6"
    print_osc4 5 "94/4d/95"
    print_osc4 6 "1f/9e/e7"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "55/55/55"
    print_osc4 9 "fa/8c/8f"
    print_osc4 10 "35/bb/9a"
    print_osc4 11 "ff/ff/55"
    print_osc4 12 "58/9d/f6"
    print_osc4 13 "e7/56/99"
    print_osc4 14 "39/79/bc"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "1d/28/37"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "1d/28/37"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f9555f"
    print_linux 2 "#21b089"
    print_linux 3 "#fef02a"
    print_linux 4 "#589df6"
    print_linux 5 "#944d95"
    print_linux 6 "#1f9ee7"
    print_linux 7 "#ffffff"
    print_linux 8 "#555555"
    print_linux 9 "#fa8c8f"
    print_linux 10 "#35bb9a"
    print_linux 11 "#ffff55"
    print_linux 12 "#589df6"
    print_linux 13 "#e75699"
    print_linux 14 "#3979bc"
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
