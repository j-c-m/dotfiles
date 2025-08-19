#!/usr/bin/env bash

# Source:   base16
# Theme:    Sparky
# Author:   Leila Sother (https://github.com/mixcoac)
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
    print_osc4 0 "07/2b/31"
    print_osc4 1 "ff/58/5d"
    print_osc4 2 "78/d6/4b"
    print_osc4 3 "fb/dd/40"
    print_osc4 4 "46/98/cb"
    print_osc4 5 "d5/9e/d7"
    print_osc4 6 "2d/cc/d3"
    print_osc4 7 "f4/f5/f0"
    print_osc4 8 "00/3b/49"
    print_osc4 9 "ff/58/5d"
    print_osc4 10 "78/d6/4b"
    print_osc4 11 "fb/dd/40"
    print_osc4 12 "46/98/cb"
    print_osc4 13 "d5/9e/d7"
    print_osc4 14 "2d/cc/d3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "f4/f5/f0"
    print_osc_rgb 11 "07/2b/31"
    print_osc_rgb 12 "f4/f5/f0"
    print_osc_rgb 17 "f5/f5/f1"
    print_osc_rgb 19 "00/31/3c"
}

do_linux() {
    print_linux 0 "#072b31"
    print_linux 1 "#ff585d"
    print_linux 2 "#78d64b"
    print_linux 3 "#fbdd40"
    print_linux 4 "#4698cb"
    print_linux 5 "#d59ed7"
    print_linux 6 "#2dccd3"
    print_linux 7 "#f4f5f0"
    print_linux 8 "#003b49"
    print_linux 9 "#ff585d"
    print_linux 10 "#78d64b"
    print_linux 11 "#fbdd40"
    print_linux 12 "#4698cb"
    print_linux 13 "#d59ed7"
    print_linux 14 "#2dccd3"
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
