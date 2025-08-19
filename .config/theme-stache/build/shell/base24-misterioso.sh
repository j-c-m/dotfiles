#!/usr/bin/env bash

# Source:   base24
# Theme:    Misterioso
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
    print_osc4 0 "2d/37/43"
    print_osc4 1 "ff/42/42"
    print_osc4 2 "74/af/68"
    print_osc4 3 "23/d7/d7"
    print_osc4 4 "33/8f/86"
    print_osc4 5 "94/13/e5"
    print_osc4 6 "23/d7/d7"
    print_osc4 7 "be/be/bd"
    print_osc4 8 "78/78/77"
    print_osc4 9 "ff/32/42"
    print_osc4 10 "74/cd/68"
    print_osc4 11 "ff/b9/29"
    print_osc4 12 "23/d7/d7"
    print_osc4 13 "ff/37/ff"
    print_osc4 14 "00/ed/e1"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "be/be/bd"
    print_osc_rgb 11 "2d/37/43"
    print_osc_rgb 12 "be/be/bd"
    print_osc_rgb 17 "e1/e1/e0"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#2d3743"
    print_linux 1 "#ff4242"
    print_linux 2 "#74af68"
    print_linux 3 "#23d7d7"
    print_linux 4 "#338f86"
    print_linux 5 "#9413e5"
    print_linux 6 "#23d7d7"
    print_linux 7 "#bebebd"
    print_linux 8 "#787877"
    print_linux 9 "#ff3242"
    print_linux 10 "#74cd68"
    print_linux 11 "#ffb929"
    print_linux 12 "#23d7d7"
    print_linux 13 "#ff37ff"
    print_linux 14 "#00ede1"
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
