#!/usr/bin/env bash

# Source:   iterm
# Theme:    Box
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cc/04/03"
    print_osc4 2 "19/cb/00"
    print_osc4 3 "ce/cb/00"
    print_osc4 4 "0d/73/cc"
    print_osc4 5 "cb/1e/d1"
    print_osc4 6 "0d/cd/cd"
    print_osc4 7 "dd/dd/dd"
    print_osc4 8 "76/76/76"
    print_osc4 9 "f2/20/1f"
    print_osc4 10 "23/fd/00"
    print_osc4 11 "ff/fd/00"
    print_osc4 12 "1a/8f/ff"
    print_osc4 13 "fd/28/ff"
    print_osc4 14 "14/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "9f/ef/00"
    print_osc_rgb 11 "14/1d/2b"
    print_osc_rgb 12 "9f/ef/00"
    print_osc_rgb 17 "a4/b1/cd"
    print_osc_rgb 19 "14/1d/2b"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cc0403"
    print_linux 2 "#19cb00"
    print_linux 3 "#cecb00"
    print_linux 4 "#0d73cc"
    print_linux 5 "#cb1ed1"
    print_linux 6 "#0dcdcd"
    print_linux 7 "#9fef00"
    print_linux 8 "#767676"
    print_linux 9 "#f2201f"
    print_linux 10 "#23fd00"
    print_linux 11 "#fffd00"
    print_linux 12 "#1a8fff"
    print_linux 13 "#fd28ff"
    print_linux 14 "#14ffff"
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
