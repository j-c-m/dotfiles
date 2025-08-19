#!/usr/bin/env bash

# Source:   gogh
# Theme:    Gogh
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
    print_osc4 0 "29/2d/3e"
    print_osc4 1 "f0/71/78"
    print_osc4 2 "62/de/84"
    print_osc4 3 "ff/cb/6b"
    print_osc4 4 "75/a1/ff"
    print_osc4 5 "f5/80/ff"
    print_osc4 6 "60/ba/ec"
    print_osc4 7 "ab/b2/bf"
    print_osc4 8 "95/9d/cb"
    print_osc4 9 "f0/71/78"
    print_osc4 10 "c3/e8/8d"
    print_osc4 11 "ff/55/72"
    print_osc4 12 "82/aa/ff"
    print_osc4 13 "ff/cb/6b"
    print_osc4 14 "67/6e/95"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "bf/c7/d5"
    print_osc_rgb 11 "29/2d/3e"
    print_osc_rgb 12 "bf/c7/d5"
    print_osc_rgb 17 "bf/c7/d5"
    print_osc_rgb 19 "29/2d/3e"
}

do_linux() {
    print_linux 0 "#292d3e"
    print_linux 1 "#f07178"
    print_linux 2 "#62de84"
    print_linux 3 "#ffcb6b"
    print_linux 4 "#75a1ff"
    print_linux 5 "#f580ff"
    print_linux 6 "#60baec"
    print_linux 7 "#bfc7d5"
    print_linux 8 "#959dcb"
    print_linux 9 "#f07178"
    print_linux 10 "#c3e88d"
    print_linux 11 "#ff5572"
    print_linux 12 "#82aaff"
    print_linux 13 "#ffcb6b"
    print_linux 14 "#676e95"
    print_linux 15 "#fffefe"
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
