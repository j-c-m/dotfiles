#!/usr/bin/env bash

# Source:   gogh
# Theme:    Selenized Black
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "25/25/25"
    print_osc4 1 "ed/4a/46"
    print_osc4 2 "70/b4/33"
    print_osc4 3 "db/b3/2d"
    print_osc4 4 "36/8a/eb"
    print_osc4 5 "eb/6e/b7"
    print_osc4 6 "3f/c5/b7"
    print_osc4 7 "77/77/77"
    print_osc4 8 "3b/3b/3b"
    print_osc4 9 "ff/5e/56"
    print_osc4 10 "83/c7/46"
    print_osc4 11 "ef/c5/41"
    print_osc4 12 "4f/9c/fe"
    print_osc4 13 "ff/81/ca"
    print_osc4 14 "56/d8/c9"
    print_osc4 15 "de/de/de"

    print_osc_rgb 10 "b9/b9/b9"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "de/de/de"
    print_osc_rgb 17 "b9/b9/b9"
    print_osc_rgb 19 "18/18/18"
}

do_linux() {
    print_linux 0 "#252525"
    print_linux 1 "#ed4a46"
    print_linux 2 "#70b433"
    print_linux 3 "#dbb32d"
    print_linux 4 "#368aeb"
    print_linux 5 "#eb6eb7"
    print_linux 6 "#3fc5b7"
    print_linux 7 "#b9b9b9"
    print_linux 8 "#3b3b3b"
    print_linux 9 "#ff5e56"
    print_linux 10 "#83c746"
    print_linux 11 "#efc541"
    print_linux 12 "#4f9cfe"
    print_linux 13 "#ff81ca"
    print_linux 14 "#56d8c9"
    print_linux 15 "#dedede"
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
