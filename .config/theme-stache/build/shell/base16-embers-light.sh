#!/usr/bin/env bash

# Source:   base16
# Theme:    Embers Light
# Author:   Jannik Siebert (https://github.com/janniks)
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
    print_osc4 0 "d1/d6/db"
    print_osc4 1 "57/6d/82"
    print_osc4 2 "6d/82/57"
    print_osc4 3 "57/82/6d"
    print_osc4 4 "82/57/6d"
    print_osc4 5 "6d/57/82"
    print_osc4 6 "82/6d/57"
    print_osc4 7 "32/3b/43"
    print_osc4 8 "75/80/8a"
    print_osc4 9 "57/6d/82"
    print_osc4 10 "6d/82/57"
    print_osc4 11 "57/82/6d"
    print_osc4 12 "82/57/6d"
    print_osc4 13 "6d/57/82"
    print_osc4 14 "82/6d/57"
    print_osc4 15 "0f/13/16"

    print_osc_rgb 10 "32/3b/43"
    print_osc_rgb 11 "d1/d6/db"
    print_osc_rgb 12 "32/3b/43"
    print_osc_rgb 17 "20/26/2c"
    print_osc_rgb 19 "ae/b6/be"
}

do_linux() {
    print_linux 0 "#d1d6db"
    print_linux 1 "#576d82"
    print_linux 2 "#6d8257"
    print_linux 3 "#57826d"
    print_linux 4 "#82576d"
    print_linux 5 "#6d5782"
    print_linux 6 "#826d57"
    print_linux 7 "#323b43"
    print_linux 8 "#75808a"
    print_linux 9 "#576d82"
    print_linux 10 "#6d8257"
    print_linux 11 "#57826d"
    print_linux 12 "#82576d"
    print_linux 13 "#6d5782"
    print_linux 14 "#826d57"
    print_linux 15 "#0f1316"
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
