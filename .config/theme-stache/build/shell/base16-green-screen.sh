#!/usr/bin/env bash

# Source:   base16
# Theme:    Green Screen
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
    print_osc4 0 "00/11/00"
    print_osc4 1 "00/77/00"
    print_osc4 2 "00/bb/00"
    print_osc4 3 "00/77/00"
    print_osc4 4 "00/99/00"
    print_osc4 5 "00/bb/00"
    print_osc4 6 "00/55/00"
    print_osc4 7 "00/bb/00"
    print_osc4 8 "00/77/00"
    print_osc4 9 "00/77/00"
    print_osc4 10 "00/bb/00"
    print_osc4 11 "00/77/00"
    print_osc4 12 "00/99/00"
    print_osc4 13 "00/bb/00"
    print_osc4 14 "00/55/00"
    print_osc4 15 "00/ff/00"

    print_osc_rgb 10 "00/bb/00"
    print_osc_rgb 11 "00/11/00"
    print_osc_rgb 12 "00/bb/00"
    print_osc_rgb 17 "00/dd/00"
    print_osc_rgb 19 "00/33/00"
}

do_linux() {
    print_linux 0 "#001100"
    print_linux 1 "#007700"
    print_linux 2 "#00bb00"
    print_linux 3 "#007700"
    print_linux 4 "#009900"
    print_linux 5 "#00bb00"
    print_linux 6 "#005500"
    print_linux 7 "#00bb00"
    print_linux 8 "#007700"
    print_linux 9 "#007700"
    print_linux 10 "#00bb00"
    print_linux 11 "#007700"
    print_linux 12 "#009900"
    print_linux 13 "#00bb00"
    print_linux 14 "#005500"
    print_linux 15 "#00ff00"
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
