#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tomorrow Night Burns
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
    print_osc4 0 "25/25/25"
    print_osc4 1 "83/2e/31"
    print_osc4 2 "a6/3b/3f"
    print_osc4 3 "d2/49/4e"
    print_osc4 4 "fc/59/5f"
    print_osc4 5 "df/93/95"
    print_osc4 6 "b9/84/86"
    print_osc4 7 "f5/f5/f5"
    print_osc4 8 "5d/6f/71"
    print_osc4 9 "83/2e/31"
    print_osc4 10 "a6/3c/3f"
    print_osc4 11 "d2/48/4d"
    print_osc4 12 "fc/59/5f"
    print_osc4 13 "df/93/95"
    print_osc4 14 "b9/84/86"
    print_osc4 15 "f5/f5/f5"

    print_osc_rgb 10 "a1/b0/b8"
    print_osc_rgb 11 "15/15/15"
    print_osc_rgb 12 "ff/44/3e"
    print_osc_rgb 17 "af/be/c5"
    print_osc_rgb 19 "29/2c/31"
}

do_linux() {
    print_linux 0 "#252525"
    print_linux 1 "#832e31"
    print_linux 2 "#a63b3f"
    print_linux 3 "#d2494e"
    print_linux 4 "#fc595f"
    print_linux 5 "#df9395"
    print_linux 6 "#b98486"
    print_linux 7 "#a1b0b8"
    print_linux 8 "#5d6f71"
    print_linux 9 "#832e31"
    print_linux 10 "#a63c3f"
    print_linux 11 "#d2484d"
    print_linux 12 "#fc595f"
    print_linux 13 "#df9395"
    print_linux 14 "#b98486"
    print_linux 15 "#f5f5f5"
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
