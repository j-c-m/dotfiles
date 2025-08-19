#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tomorrow Night Bright
# Author:   Chris Kempson (http://chriskempson.com)
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
    print_osc4 0 "2a/2a/2a"
    print_osc4 1 "d5/4e/53"
    print_osc4 2 "b9/ca/4a"
    print_osc4 3 "e7/c5/47"
    print_osc4 4 "7a/a6/da"
    print_osc4 5 "c3/97/d8"
    print_osc4 6 "70/c0/b1"
    print_osc4 7 "ea/ea/ea"
    print_osc4 8 "96/98/96"
    print_osc4 9 "d5/4e/53"
    print_osc4 10 "b9/ca/4a"
    print_osc4 11 "e7/c5/47"
    print_osc4 12 "7a/a6/da"
    print_osc4 13 "c3/97/d8"
    print_osc4 14 "70/c0/b1"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ea/ea/ea"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ea/ea/ea"
    print_osc_rgb 17 "ea/ea/ea"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#2a2a2a"
    print_linux 1 "#d54e53"
    print_linux 2 "#b9ca4a"
    print_linux 3 "#e7c547"
    print_linux 4 "#7aa6da"
    print_linux 5 "#c397d8"
    print_linux 6 "#70c0b1"
    print_linux 7 "#eaeaea"
    print_linux 8 "#969896"
    print_linux 9 "#d54e53"
    print_linux 10 "#b9ca4a"
    print_linux 11 "#e7c547"
    print_linux 12 "#7aa6da"
    print_linux 13 "#c397d8"
    print_linux 14 "#70c0b1"
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
