#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tinacious Design (Dark)
# Author:   unknown
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
    print_osc4 0 "1d/1d/26"
    print_osc4 1 "ff/33/99"
    print_osc4 2 "00/d3/64"
    print_osc4 3 "ff/cc/66"
    print_osc4 4 "00/cb/ff"
    print_osc4 5 "cc/66/ff"
    print_osc4 6 "00/ce/ca"
    print_osc4 7 "cb/cb/f0"
    print_osc4 8 "62/65/66"
    print_osc4 9 "ff/2f/92"
    print_osc4 10 "00/d3/64"
    print_osc4 11 "ff/d4/78"
    print_osc4 12 "00/cb/ff"
    print_osc4 13 "d7/83/ff"
    print_osc4 14 "00/d5/d4"
    print_osc4 15 "d4/d5/f3"

    print_osc_rgb 10 "cb/cb/f0"
    print_osc_rgb 11 "1d/1d/26"
    print_osc_rgb 12 "cb/cb/f0"
    print_osc_rgb 17 "ff/33/99"
    print_osc_rgb 19 "fe/ff/ff"
}

do_linux() {
    print_linux 0 "#1d1d26"
    print_linux 1 "#ff3399"
    print_linux 2 "#00d364"
    print_linux 3 "#ffcc66"
    print_linux 4 "#00cbff"
    print_linux 5 "#cc66ff"
    print_linux 6 "#00ceca"
    print_linux 7 "#cbcbf0"
    print_linux 8 "#626566"
    print_linux 9 "#ff2f92"
    print_linux 10 "#00d364"
    print_linux 11 "#ffd478"
    print_linux 12 "#00cbff"
    print_linux 13 "#d783ff"
    print_linux 14 "#00d5d4"
    print_linux 15 "#d4d5f3"
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
