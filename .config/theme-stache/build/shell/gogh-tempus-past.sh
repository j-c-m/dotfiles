#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Past
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "53/54/5b"
    print_osc4 1 "c0/0c/50"
    print_osc4 2 "0a/70/40"
    print_osc4 3 "a6/40/3a"
    print_osc4 4 "17/63/aa"
    print_osc4 5 "b0/28/74"
    print_osc4 6 "09/6a/83"
    print_osc4 7 "ea/e2/de"
    print_osc4 8 "80/56/5d"
    print_osc4 9 "bd/31/33"
    print_osc4 10 "33/72/43"
    print_osc4 11 "8d/55/4a"
    print_osc4 12 "55/59/bb"
    print_osc4 13 "b0/22/a7"
    print_osc4 14 "07/70/7a"
    print_osc4 15 "f3/f2/f4"

    print_osc_rgb 10 "53/54/5b"
    print_osc_rgb 11 "f3/f2/f4"
    print_osc_rgb 12 "53/54/5b"
    print_osc_rgb 17 "53/54/5b"
    print_osc_rgb 19 "f3/f2/f4"
}

do_linux() {
    print_linux 0 "#53545b"
    print_linux 1 "#c00c50"
    print_linux 2 "#0a7040"
    print_linux 3 "#a6403a"
    print_linux 4 "#1763aa"
    print_linux 5 "#b02874"
    print_linux 6 "#096a83"
    print_linux 7 "#53545b"
    print_linux 8 "#80565d"
    print_linux 9 "#bd3133"
    print_linux 10 "#337243"
    print_linux 11 "#8d554a"
    print_linux 12 "#5559bb"
    print_linux 13 "#b022a7"
    print_linux 14 "#07707a"
    print_linux 15 "#f3f2f4"
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
