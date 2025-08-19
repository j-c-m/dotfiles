#!/usr/bin/env bash

# Source:   base24
# Theme:    Obsidian
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
    print_osc4 0 "27/30/32"
    print_osc4 1 "a5/00/01"
    print_osc4 2 "00/bb/00"
    print_osc4 3 "a0/d6/ff"
    print_osc4 4 "39/9b/da"
    print_osc4 5 "bb/00/bb"
    print_osc4 6 "00/bb/bb"
    print_osc4 7 "a1/a1/a1"
    print_osc4 8 "6e/6e/6e"
    print_osc4 9 "ff/00/03"
    print_osc4 10 "92/c7/63"
    print_osc4 11 "fe/f7/73"
    print_osc4 12 "a0/d6/ff"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "55/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a1/a1/a1"
    print_osc_rgb 11 "27/30/32"
    print_osc_rgb 12 "a1/a1/a1"
    print_osc_rgb 17 "bb/bb/bb"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#273032"
    print_linux 1 "#a50001"
    print_linux 2 "#00bb00"
    print_linux 3 "#a0d6ff"
    print_linux 4 "#399bda"
    print_linux 5 "#bb00bb"
    print_linux 6 "#00bbbb"
    print_linux 7 "#a1a1a1"
    print_linux 8 "#6e6e6e"
    print_linux 9 "#ff0003"
    print_linux 10 "#92c763"
    print_linux 11 "#fef773"
    print_linux 12 "#a0d6ff"
    print_linux 13 "#ff55ff"
    print_linux 14 "#55ffff"
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
