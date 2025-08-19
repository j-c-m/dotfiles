#!/usr/bin/env bash

# Source:   base24
# Theme:    Tango Adapted
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "ff/fe/fe"
    print_osc4 1 "ff/00/00"
    print_osc4 2 "59/d5/00"
    print_osc4 3 "88/c9/ff"
    print_osc4 4 "00/a1/ff"
    print_osc4 5 "c1/7e/cb"
    print_osc4 6 "00/d0/d6"
    print_osc4 7 "d0/d4/cb"
    print_osc4 8 "a4/a8/9f"
    print_osc4 9 "ff/00/12"
    print_osc4 10 "93/fe/00"
    print_osc4 11 "ff/f0/21"
    print_osc4 12 "88/c9/ff"
    print_osc4 13 "e8/a6/e1"
    print_osc4 14 "00/fd/ff"
    print_osc4 15 "f6/f6/f4"

    print_osc_rgb 10 "d0/d4/cb"
    print_osc_rgb 11 "ff/fe/fe"
    print_osc_rgb 12 "d0/d4/cb"
    print_osc_rgb 17 "e6/ea/e1"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#fffefe"
    print_linux 1 "#ff0000"
    print_linux 2 "#59d500"
    print_linux 3 "#88c9ff"
    print_linux 4 "#00a1ff"
    print_linux 5 "#c17ecb"
    print_linux 6 "#00d0d6"
    print_linux 7 "#d0d4cb"
    print_linux 8 "#a4a89f"
    print_linux 9 "#ff0012"
    print_linux 10 "#93fe00"
    print_linux 11 "#fff021"
    print_linux 12 "#88c9ff"
    print_linux 13 "#e8a6e1"
    print_linux 14 "#00fdff"
    print_linux 15 "#f6f6f4"
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
