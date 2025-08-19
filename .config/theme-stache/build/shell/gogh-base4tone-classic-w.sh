#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic W
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
    print_osc4 0 "20/1d/1e"
    print_osc4 1 "b8/73/05"
    print_osc4 2 "ca/45/de"
    print_osc4 3 "e1/7e/f1"
    print_osc4 4 "eb/75/a2"
    print_osc4 5 "e9/72/63"
    print_osc4 6 "d7/63/e9"
    print_osc4 7 "ed/e8/ea"
    print_osc4 8 "0d/08/0a"
    print_osc4 9 "e6/97/1a"
    print_osc4 10 "e6/91/f3"
    print_osc4 11 "ed/b1/f6"
    print_osc4 12 "f8/bf/d5"
    print_osc4 13 "f1/8c/7e"
    print_osc4 14 "f6/b1/cc"
    print_osc4 15 "f9/f6/f7"

    print_osc_rgb 10 "9e/94/98"
    print_osc_rgb 11 "20/1d/1e"
    print_osc_rgb 12 "7f/74/81"
    print_osc_rgb 17 "9e/94/98"
    print_osc_rgb 19 "20/1d/1e"
}

do_linux() {
    print_linux 0 "#201d1e"
    print_linux 1 "#b87305"
    print_linux 2 "#ca45de"
    print_linux 3 "#e17ef1"
    print_linux 4 "#eb75a2"
    print_linux 5 "#e97263"
    print_linux 6 "#d763e9"
    print_linux 7 "#9e9498"
    print_linux 8 "#0d080a"
    print_linux 9 "#e6971a"
    print_linux 10 "#e691f3"
    print_linux 11 "#edb1f6"
    print_linux 12 "#f8bfd5"
    print_linux 13 "#f18c7e"
    print_linux 14 "#f6b1cc"
    print_linux 15 "#f9f6f7"
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
