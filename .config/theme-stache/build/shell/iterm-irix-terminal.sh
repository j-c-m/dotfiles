#!/usr/bin/env bash

# Source:   iterm
# Theme:    IRIX Terminal
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "19/19/19"
    print_osc4 1 "ff/2b/1d"
    print_osc4 2 "56/ff/3d"
    print_osc4 3 "ff/fe/44"
    print_osc4 4 "00/04/ff"
    print_osc4 5 "ff/2c/ff"
    print_osc4 6 "55/ff/ff"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "ff/fe/44"
    print_osc4 9 "ff/fe/44"
    print_osc4 10 "ff/fe/44"
    print_osc4 11 "fe/fb/72"
    print_osc4 12 "ff/fe/44"
    print_osc4 13 "ff/fe/44"
    print_osc4 14 "ff/fe/44"
    print_osc4 15 "ff/fe/44"

    print_osc_rgb 10 "f2/f2/f2"
    print_osc_rgb 11 "00/00/42"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#ff2b1d"
    print_linux 2 "#56ff3d"
    print_linux 3 "#fffe44"
    print_linux 4 "#0004ff"
    print_linux 5 "#ff2cff"
    print_linux 6 "#55ffff"
    print_linux 7 "#f2f2f2"
    print_linux 8 "#fffe44"
    print_linux 9 "#fffe44"
    print_linux 10 "#fffe44"
    print_linux 11 "#fefb72"
    print_linux 12 "#fffe44"
    print_linux 13 "#fffe44"
    print_linux 14 "#fffe44"
    print_linux 15 "#fffe44"
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
