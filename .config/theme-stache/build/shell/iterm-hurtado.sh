#!/usr/bin/env bash

# Source:   iterm
# Theme:    Hurtado
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
    print_osc4 0 "57/57/57"
    print_osc4 1 "ff/1b/00"
    print_osc4 2 "a5/df/55"
    print_osc4 3 "fb/e7/4a"
    print_osc4 4 "48/63/87"
    print_osc4 5 "fc/5e/f0"
    print_osc4 6 "85/e9/fe"
    print_osc4 7 "cb/cb/cb"
    print_osc4 8 "25/25/25"
    print_osc4 9 "d4/1c/00"
    print_osc4 10 "a5/df/55"
    print_osc4 11 "fb/e7/49"
    print_osc4 12 "89/bd/ff"
    print_osc4 13 "bf/00/c0"
    print_osc4 14 "85/e9/fe"
    print_osc4 15 "db/db/db"

    print_osc_rgb 10 "da/db/da"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "b4/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#575757"
    print_linux 1 "#ff1b00"
    print_linux 2 "#a5df55"
    print_linux 3 "#fbe74a"
    print_linux 4 "#486387"
    print_linux 5 "#fc5ef0"
    print_linux 6 "#85e9fe"
    print_linux 7 "#dadbda"
    print_linux 8 "#252525"
    print_linux 9 "#d41c00"
    print_linux 10 "#a5df55"
    print_linux 11 "#fbe749"
    print_linux 12 "#89bdff"
    print_linux 13 "#bf00c0"
    print_linux 14 "#85e9fe"
    print_linux 15 "#dbdbdb"
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
