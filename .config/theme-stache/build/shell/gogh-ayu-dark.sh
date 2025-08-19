#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ayu Dark
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
    print_osc4 0 "0a/0e/14"
    print_osc4 1 "ff/33/33"
    print_osc4 2 "c2/d9/4c"
    print_osc4 3 "ff/8f/40"
    print_osc4 4 "59/c2/ff"
    print_osc4 5 "ff/ee/99"
    print_osc4 6 "95/e6/cb"
    print_osc4 7 "b3/b1/ad"
    print_osc4 8 "4d/55/66"
    print_osc4 9 "ff/33/33"
    print_osc4 10 "c2/d9/4c"
    print_osc4 11 "ff/8f/40"
    print_osc4 12 "59/c2/ff"
    print_osc4 13 "ff/ee/99"
    print_osc4 14 "95/e6/cb"
    print_osc4 15 "b3/b1/ad"

    print_osc_rgb 10 "b3/b1/ad"
    print_osc_rgb 11 "0a/0e/14"
    print_osc_rgb 12 "e6/b4/50"
    print_osc_rgb 17 "b3/b1/ad"
    print_osc_rgb 19 "0a/0e/14"
}

do_linux() {
    print_linux 0 "#0a0e14"
    print_linux 1 "#ff3333"
    print_linux 2 "#c2d94c"
    print_linux 3 "#ff8f40"
    print_linux 4 "#59c2ff"
    print_linux 5 "#ffee99"
    print_linux 6 "#95e6cb"
    print_linux 7 "#b3b1ad"
    print_linux 8 "#4d5566"
    print_linux 9 "#ff3333"
    print_linux 10 "#c2d94c"
    print_linux 11 "#ff8f40"
    print_linux 12 "#59c2ff"
    print_linux 13 "#ffee99"
    print_linux 14 "#95e6cb"
    print_linux 15 "#b3b1ad"
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
