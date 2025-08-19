#!/usr/bin/env bash

# Source:   iterm
# Theme:    Apple System Colors Light
# Author:   unknown
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
    print_osc4 0 "1a/19/19"
    print_osc4 1 "cb/37/2e"
    print_osc4 2 "26/a3/39"
    print_osc4 3 "cc/ab/07"
    print_osc4 4 "07/69/cb"
    print_osc4 5 "96/46/be"
    print_osc4 6 "47/9e/c1"
    print_osc4 7 "98/97/9c"
    print_osc4 8 "46/45/45"
    print_osc4 9 "fe/45/39"
    print_osc4 10 "32/d6/4a"
    print_osc4 11 "fe/d6/09"
    print_osc4 12 "09/83/fe"
    print_osc4 13 "be/59/f2"
    print_osc4 14 "75/d5/fe"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "fd/fe/fe"
    print_osc_rgb 12 "98/97/9c"
    print_osc_rgb 17 "aa/d8/fe"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#1a1919"
    print_linux 1 "#cb372e"
    print_linux 2 "#26a339"
    print_linux 3 "#ccab07"
    print_linux 4 "#0769cb"
    print_linux 5 "#9646be"
    print_linux 6 "#479ec1"
    print_linux 7 "#000000"
    print_linux 8 "#464545"
    print_linux 9 "#fe4539"
    print_linux 10 "#32d64a"
    print_linux 11 "#fed609"
    print_linux 12 "#0983fe"
    print_linux 13 "#be59f2"
    print_linux 14 "#75d5fe"
    print_linux 15 "#fefefe"
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
