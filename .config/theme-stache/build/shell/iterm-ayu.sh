#!/usr/bin/env bash

# Source:   iterm
# Theme:    ayu
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/33/33"
    print_osc4 2 "b8/cc/52"
    print_osc4 3 "e7/c5/47"
    print_osc4 4 "36/a3/d9"
    print_osc4 5 "f0/71/78"
    print_osc4 6 "95/e6/cb"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "32/32/32"
    print_osc4 9 "ff/65/65"
    print_osc4 10 "ea/fe/84"
    print_osc4 11 "ff/f7/79"
    print_osc4 12 "68/d5/ff"
    print_osc4 13 "ff/a3/aa"
    print_osc4 14 "c7/ff/fd"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e6/e1/cf"
    print_osc_rgb 11 "0f/14/19"
    print_osc_rgb 12 "f2/97/18"
    print_osc_rgb 17 "25/33/40"
    print_osc_rgb 19 "e6/e1/cf"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff3333"
    print_linux 2 "#b8cc52"
    print_linux 3 "#e7c547"
    print_linux 4 "#36a3d9"
    print_linux 5 "#f07178"
    print_linux 6 "#95e6cb"
    print_linux 7 "#e6e1cf"
    print_linux 8 "#323232"
    print_linux 9 "#ff6565"
    print_linux 10 "#eafe84"
    print_linux 11 "#fff779"
    print_linux 12 "#68d5ff"
    print_linux 13 "#ffa3aa"
    print_linux 14 "#c7fffd"
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
