#!/usr/bin/env bash

# Source:   iterm
# Theme:    NvimDark
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
    print_osc4 0 "07/08/0d"
    print_osc4 1 "ff/c0/b9"
    print_osc4 2 "b3/f6/c0"
    print_osc4 3 "fc/e0/94"
    print_osc4 4 "a6/db/ff"
    print_osc4 5 "ff/ca/ff"
    print_osc4 6 "8c/f8/f7"
    print_osc4 7 "ee/f1/f8"
    print_osc4 8 "4f/52/58"
    print_osc4 9 "ff/c0/b9"
    print_osc4 10 "b3/f6/c0"
    print_osc4 11 "fc/e0/94"
    print_osc4 12 "a6/db/ff"
    print_osc4 13 "ff/ca/ff"
    print_osc4 14 "8c/f8/f7"
    print_osc4 15 "ee/f1/f8"

    print_osc_rgb 10 "e0/e2/ea"
    print_osc_rgb 11 "14/16/1b"
    print_osc_rgb 12 "9b/9e/a4"
    print_osc_rgb 17 "4f/52/58"
    print_osc_rgb 19 "e0/e2/ea"
}

do_linux() {
    print_linux 0 "#07080d"
    print_linux 1 "#ffc0b9"
    print_linux 2 "#b3f6c0"
    print_linux 3 "#fce094"
    print_linux 4 "#a6dbff"
    print_linux 5 "#ffcaff"
    print_linux 6 "#8cf8f7"
    print_linux 7 "#e0e2ea"
    print_linux 8 "#4f5258"
    print_linux 9 "#ffc0b9"
    print_linux 10 "#b3f6c0"
    print_linux 11 "#fce094"
    print_linux 12 "#a6dbff"
    print_linux 13 "#ffcaff"
    print_linux 14 "#8cf8f7"
    print_linux 15 "#eef1f8"
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
