#!/usr/bin/env bash

# Source:   base24
# Theme:    Wez
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cc/55/55"
    print_osc4 2 "55/cc/55"
    print_osc4 3 "55/55/ff"
    print_osc4 4 "54/55/cb"
    print_osc4 5 "cc/55/cc"
    print_osc4 6 "7a/ca/ca"
    print_osc4 7 "ae/ae/ae"
    print_osc4 8 "72/72/72"
    print_osc4 9 "ff/55/55"
    print_osc4 10 "55/ff/55"
    print_osc4 11 "ff/ff/55"
    print_osc4 12 "55/55/ff"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "55/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ae/ae/ae"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ae/ae/ae"
    print_osc_rgb 17 "cc/cc/cc"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cc5555"
    print_linux 2 "#55cc55"
    print_linux 3 "#5555ff"
    print_linux 4 "#5455cb"
    print_linux 5 "#cc55cc"
    print_linux 6 "#7acaca"
    print_linux 7 "#aeaeae"
    print_linux 8 "#727272"
    print_linux 9 "#ff5555"
    print_linux 10 "#55ff55"
    print_linux 11 "#ffff55"
    print_linux 12 "#5555ff"
    print_linux 13 "#ff55ff"
    print_linux 14 "#55ffff"
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
