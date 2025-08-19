#!/usr/bin/env bash

# Source:   iterm
# Theme:    Blue Matrix
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
    print_osc4 0 "10/11/16"
    print_osc4 1 "ff/56/7f"
    print_osc4 2 "00/ff/9b"
    print_osc4 3 "fe/fc/57"
    print_osc4 4 "00/b0/fe"
    print_osc4 5 "d4/7b/fe"
    print_osc4 6 "75/c1/fe"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "67/67/67"
    print_osc4 9 "ff/6d/67"
    print_osc4 10 "5f/f9/67"
    print_osc4 11 "fe/fb/67"
    print_osc4 12 "68/71/ff"
    print_osc4 13 "d5/82/eb"
    print_osc4 14 "5f/fd/ff"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "00/a2/fe"
    print_osc_rgb 11 "0f/11/15"
    print_osc_rgb 12 "76/ff/9f"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#101116"
    print_linux 1 "#ff567f"
    print_linux 2 "#00ff9b"
    print_linux 3 "#fefc57"
    print_linux 4 "#00b0fe"
    print_linux 5 "#d47bfe"
    print_linux 6 "#75c1fe"
    print_linux 7 "#00a2fe"
    print_linux 8 "#676767"
    print_linux 9 "#ff6d67"
    print_linux 10 "#5ff967"
    print_linux 11 "#fefb67"
    print_linux 12 "#6871ff"
    print_linux 13 "#d582eb"
    print_linux 14 "#5ffdff"
    print_linux 15 "#feffff"
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
