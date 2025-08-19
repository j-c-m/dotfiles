#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tin
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
    print_osc4 1 "8d/53/4e"
    print_osc4 2 "4e/8d/53"
    print_osc4 3 "88/8d/4e"
    print_osc4 4 "53/4e/8d"
    print_osc4 5 "8d/4e/88"
    print_osc4 6 "4e/88/8d"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "b5/7d/78"
    print_osc4 10 "78/b5/7d"
    print_osc4 11 "b0/b5/78"
    print_osc4 12 "7d/78/b5"
    print_osc4 13 "b5/78/b0"
    print_osc4 14 "78/b0/b5"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "2e/2e/35"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "2e/2e/35"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#8d534e"
    print_linux 2 "#4e8d53"
    print_linux 3 "#888d4e"
    print_linux 4 "#534e8d"
    print_linux 5 "#8d4e88"
    print_linux 6 "#4e888d"
    print_linux 7 "#ffffff"
    print_linux 8 "#000000"
    print_linux 9 "#b57d78"
    print_linux 10 "#78b57d"
    print_linux 11 "#b0b578"
    print_linux 12 "#7d78b5"
    print_linux 13 "#b578b0"
    print_linux 14 "#78b0b5"
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
