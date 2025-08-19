#!/usr/bin/env bash

# Source:   gogh
# Theme:    Spacegray Eighties
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
    print_osc4 0 "15/17/1c"
    print_osc4 1 "ec/5f/67"
    print_osc4 2 "81/a7/64"
    print_osc4 3 "fe/c2/54"
    print_osc4 4 "54/86/c0"
    print_osc4 5 "bf/83/c1"
    print_osc4 6 "57/c2/c1"
    print_osc4 7 "ef/ec/e7"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/69/73"
    print_osc4 10 "93/d4/93"
    print_osc4 11 "ff/d2/56"
    print_osc4 12 "4d/84/d1"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "83/e9/e4"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bd/ba/ae"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "bd/ba/ae"
    print_osc_rgb 17 "bd/ba/ae"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#15171c"
    print_linux 1 "#ec5f67"
    print_linux 2 "#81a764"
    print_linux 3 "#fec254"
    print_linux 4 "#5486c0"
    print_linux 5 "#bf83c1"
    print_linux 6 "#57c2c1"
    print_linux 7 "#bdbaae"
    print_linux 8 "#555555"
    print_linux 9 "#ff6973"
    print_linux 10 "#93d493"
    print_linux 11 "#ffd256"
    print_linux 12 "#4d84d1"
    print_linux 13 "#ff55ff"
    print_linux 14 "#83e9e4"
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
