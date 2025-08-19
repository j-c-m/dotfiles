#!/usr/bin/env bash

# Source:   iterm
# Theme:    CobaltNext
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "fe/51/7b"
    print_osc4 2 "8b/c8/8e"
    print_osc4 3 "fe/c5/4c"
    print_osc4 4 "40/9d/d3"
    print_osc4 5 "cb/a3/c7"
    print_osc4 6 "37/b5/b4"
    print_osc4 7 "d6/de/ea"
    print_osc4 8 "61/73/7f"
    print_osc4 9 "e3/7d/8a"
    print_osc4 10 "ba/dd/bb"
    print_osc4 11 "fe/dc/90"
    print_osc4 12 "7a/bf/eb"
    print_osc4 13 "f3/cb/ef"
    print_osc4 14 "83/e4/e3"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "d6/de/ea"
    print_osc_rgb 11 "15/2b/34"
    print_osc_rgb 12 "fe/c5/4c"
    print_osc_rgb 17 "4b/5b/67"
    print_osc_rgb 19 "fe/fe/fe"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fe517b"
    print_linux 2 "#8bc88e"
    print_linux 3 "#fec54c"
    print_linux 4 "#409dd3"
    print_linux 5 "#cba3c7"
    print_linux 6 "#37b5b4"
    print_linux 7 "#d6deea"
    print_linux 8 "#61737f"
    print_linux 9 "#e37d8a"
    print_linux 10 "#baddbb"
    print_linux 11 "#fedc90"
    print_linux 12 "#7abfeb"
    print_linux 13 "#f3cbef"
    print_linux 14 "#83e4e3"
    print_linux 15 "#fefefe"
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
