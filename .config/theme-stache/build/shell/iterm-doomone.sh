#!/usr/bin/env bash

# Source:   iterm
# Theme:    DoomOne
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/6c/6b"
    print_osc4 2 "98/be/65"
    print_osc4 3 "ec/be/7b"
    print_osc4 4 "a9/a1/e1"
    print_osc4 5 "c6/78/dd"
    print_osc4 6 "51/af/ef"
    print_osc4 7 "bb/c2/cf"
    print_osc4 8 "00/00/00"
    print_osc4 9 "ff/66/55"
    print_osc4 10 "99/bb/66"
    print_osc4 11 "ec/be/7b"
    print_osc4 12 "a9/a1/e1"
    print_osc4 13 "c6/78/dd"
    print_osc4 14 "51/af/ef"
    print_osc4 15 "bf/bf/bf"

    print_osc_rgb 10 "bb/c2/cf"
    print_osc_rgb 11 "28/2c/34"
    print_osc_rgb 12 "51/af/ef"
    print_osc_rgb 17 "42/44/4b"
    print_osc_rgb 19 "bb/c2/cf"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff6c6b"
    print_linux 2 "#98be65"
    print_linux 3 "#ecbe7b"
    print_linux 4 "#a9a1e1"
    print_linux 5 "#c678dd"
    print_linux 6 "#51afef"
    print_linux 7 "#bbc2cf"
    print_linux 8 "#000000"
    print_linux 9 "#ff6655"
    print_linux 10 "#99bb66"
    print_linux 11 "#ecbe7b"
    print_linux 12 "#a9a1e1"
    print_linux 13 "#c678dd"
    print_linux 14 "#51afef"
    print_linux 15 "#bfbfbf"
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
