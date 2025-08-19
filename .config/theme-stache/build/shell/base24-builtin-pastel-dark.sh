#!/usr/bin/env bash

# Source:   base24
# Theme:    Builtin Pastel Dark
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 1 "ff/6b/60"
    print_osc4 2 "a7/ff/60"
    print_osc4 3 "b5/dc/fe"
    print_osc4 4 "96/ca/fd"
    print_osc4 5 "ff/73/fd"
    print_osc4 6 "c6/c4/fd"
    print_osc4 7 "d1/d1/d1"
    print_osc4 8 "98/98/98"
    print_osc4 9 "ff/b6/b0"
    print_osc4 10 "ce/ff/ab"
    print_osc4 11 "ff/ff/cb"
    print_osc4 12 "b5/dc/fe"
    print_osc4 13 "ff/9c/fe"
    print_osc4 14 "df/df/fe"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d1/d1/d1"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "d1/d1/d1"
    print_osc_rgb 17 "ee/ee/ee"
    print_osc_rgb 19 "4e/4e/4e"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff6b60"
    print_linux 2 "#a7ff60"
    print_linux 3 "#b5dcfe"
    print_linux 4 "#96cafd"
    print_linux 5 "#ff73fd"
    print_linux 6 "#c6c4fd"
    print_linux 7 "#d1d1d1"
    print_linux 8 "#989898"
    print_linux 9 "#ffb6b0"
    print_linux 10 "#ceffab"
    print_linux 11 "#ffffcb"
    print_linux 12 "#b5dcfe"
    print_linux 13 "#ff9cfe"
    print_linux 14 "#dfdffe"
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
