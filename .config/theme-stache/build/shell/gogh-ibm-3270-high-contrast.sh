#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ibm 3270 (High Contrast)
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/00/00"
    print_osc4 2 "00/ff/00"
    print_osc4 3 "ff/ff/00"
    print_osc4 4 "00/bf/ff"
    print_osc4 5 "ff/c0/cb"
    print_osc4 6 "40/e0/d0"
    print_osc4 7 "be/be/be"
    print_osc4 8 "41/41/41"
    print_osc4 9 "ff/a5/00"
    print_osc4 10 "98/fb/98"
    print_osc4 11 "ff/ff/00"
    print_osc4 12 "00/00/cd"
    print_osc4 13 "a0/20/f0"
    print_osc4 14 "ae/ee/ee"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "fd/fd/fd"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "fd/fd/fd"
    print_osc_rgb 17 "fd/fd/fd"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff0000"
    print_linux 2 "#00ff00"
    print_linux 3 "#ffff00"
    print_linux 4 "#00bfff"
    print_linux 5 "#ffc0cb"
    print_linux 6 "#40e0d0"
    print_linux 7 "#fdfdfd"
    print_linux 8 "#414141"
    print_linux 9 "#ffa500"
    print_linux 10 "#98fb98"
    print_linux 11 "#ffff00"
    print_linux 12 "#0000cd"
    print_linux 13 "#a020f0"
    print_linux 14 "#aeeeee"
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
