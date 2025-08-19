#!/usr/bin/env bash

# Source:   iterm
# Theme:    CLRS
# Author:   unknown
# Variant:  light

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
    print_osc4 1 "f7/27/29"
    print_osc4 2 "32/89/5c"
    print_osc4 3 "f9/6f/1c"
    print_osc4 4 "12/5c/cf"
    print_osc4 5 "9f/00/bc"
    print_osc4 6 "32/c2/c0"
    print_osc4 7 "b2/b2/b2"
    print_osc4 8 "54/57/53"
    print_osc4 9 "fb/04/16"
    print_osc4 10 "2c/c6/31"
    print_osc4 11 "fc/d6/27"
    print_osc4 12 "15/6f/fe"
    print_osc4 13 "e8/00/b0"
    print_osc4 14 "39/d5/ce"
    print_osc4 15 "ed/ed/ec"

    print_osc_rgb 10 "26/26/26"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "6f/d2/fc"
    print_osc_rgb 17 "6f/d2/fc"
    print_osc_rgb 19 "03/16/30"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f72729"
    print_linux 2 "#32895c"
    print_linux 3 "#f96f1c"
    print_linux 4 "#125ccf"
    print_linux 5 "#9f00bc"
    print_linux 6 "#32c2c0"
    print_linux 7 "#262626"
    print_linux 8 "#545753"
    print_linux 9 "#fb0416"
    print_linux 10 "#2cc631"
    print_linux 11 "#fcd627"
    print_linux 12 "#156ffe"
    print_linux 13 "#e800b0"
    print_linux 14 "#39d5ce"
    print_linux 15 "#ededec"
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
