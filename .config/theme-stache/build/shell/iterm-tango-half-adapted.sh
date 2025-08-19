#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tango Half Adapted
# Author:   unknown
# Variant:  light

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
    print_osc4 1 "ff/00/00"
    print_osc4 2 "4c/c3/00"
    print_osc4 3 "e2/bf/00"
    print_osc4 4 "00/8d/f5"
    print_osc4 5 "a8/6b/b2"
    print_osc4 6 "00/bd/c3"
    print_osc4 7 "e0/e4/db"
    print_osc4 8 "79/7c/75"
    print_osc4 9 "ff/00/12"
    print_osc4 10 "8a/f6/00"
    print_osc4 11 "ff/eb/00"
    print_osc4 12 "75/be/ff"
    print_osc4 13 "d7/98/d0"
    print_osc4 14 "00/f6/fa"
    print_osc4 15 "f3/f3/f1"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "ff/fe/fe"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff0000"
    print_linux 2 "#4cc300"
    print_linux 3 "#e2bf00"
    print_linux 4 "#008df5"
    print_linux 5 "#a86bb2"
    print_linux 6 "#00bdc3"
    print_linux 7 "#000000"
    print_linux 8 "#797c75"
    print_linux 9 "#ff0012"
    print_linux 10 "#8af600"
    print_linux 11 "#ffeb00"
    print_linux 12 "#75beff"
    print_linux 13 "#d798d0"
    print_linux 14 "#00f6fa"
    print_linux 15 "#f3f3f1"
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
