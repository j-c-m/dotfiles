#!/usr/bin/env bash

# Source:   iterm
# Theme:    The Hulk
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
    print_osc4 0 "1b/1d/1e"
    print_osc4 1 "25/9d/1a"
    print_osc4 2 "13/ce/2f"
    print_osc4 3 "62/e4/56"
    print_osc4 4 "24/24/f4"
    print_osc4 5 "64/1e/73"
    print_osc4 6 "37/8c/a9"
    print_osc4 7 "d8/d8/d0"
    print_osc4 8 "50/53/54"
    print_osc4 9 "8d/ff/2a"
    print_osc4 10 "48/ff/76"
    print_osc4 11 "3a/fe/15"
    print_osc4 12 "4f/6a/95"
    print_osc4 13 "72/57/9d"
    print_osc4 14 "3f/85/a5"
    print_osc4 15 "e5/e5/e0"

    print_osc_rgb 10 "b4/b4/b4"
    print_osc_rgb 11 "1b/1d/1e"
    print_osc_rgb 12 "15/b6/1a"
    print_osc_rgb 17 "4d/4f/4c"
    print_osc_rgb 19 "0b/62/08"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#259d1a"
    print_linux 2 "#13ce2f"
    print_linux 3 "#62e456"
    print_linux 4 "#2424f4"
    print_linux 5 "#641e73"
    print_linux 6 "#378ca9"
    print_linux 7 "#b4b4b4"
    print_linux 8 "#505354"
    print_linux 9 "#8dff2a"
    print_linux 10 "#48ff76"
    print_linux 11 "#3afe15"
    print_linux 12 "#4f6a95"
    print_linux 13 "#72579d"
    print_linux 14 "#3f85a5"
    print_linux 15 "#e5e5e0"
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
