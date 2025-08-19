#!/usr/bin/env bash

# Source:   base16
# Theme:    Kanagawa
# Author:   Tommaso Laurenzi (https://github.com/rebelot)
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
    print_osc4 0 "1f/1f/28"
    print_osc4 1 "c3/40/43"
    print_osc4 2 "76/94/6a"
    print_osc4 3 "c0/a3/6e"
    print_osc4 4 "7e/9c/d8"
    print_osc4 5 "95/7f/b8"
    print_osc4 6 "6a/95/89"
    print_osc4 7 "dc/d7/ba"
    print_osc4 8 "54/54/6d"
    print_osc4 9 "c3/40/43"
    print_osc4 10 "76/94/6a"
    print_osc4 11 "c0/a3/6e"
    print_osc4 12 "7e/9c/d8"
    print_osc4 13 "95/7f/b8"
    print_osc4 14 "6a/95/89"
    print_osc4 15 "71/7c/7c"

    print_osc_rgb 10 "dc/d7/ba"
    print_osc_rgb 11 "1f/1f/28"
    print_osc_rgb 12 "dc/d7/ba"
    print_osc_rgb 17 "c8/c0/93"
    print_osc_rgb 19 "16/16/1d"
}

do_linux() {
    print_linux 0 "#1f1f28"
    print_linux 1 "#c34043"
    print_linux 2 "#76946a"
    print_linux 3 "#c0a36e"
    print_linux 4 "#7e9cd8"
    print_linux 5 "#957fb8"
    print_linux 6 "#6a9589"
    print_linux 7 "#dcd7ba"
    print_linux 8 "#54546d"
    print_linux 9 "#c34043"
    print_linux 10 "#76946a"
    print_linux 11 "#c0a36e"
    print_linux 12 "#7e9cd8"
    print_linux 13 "#957fb8"
    print_linux 14 "#6a9589"
    print_linux 15 "#717c7c"
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
