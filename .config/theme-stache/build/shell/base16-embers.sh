#!/usr/bin/env bash

# Source:   base16
# Theme:    Embers
# Author:   Jannik Siebert (https://github.com/janniks)
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
    print_osc4 0 "16/13/0f"
    print_osc4 1 "82/6d/57"
    print_osc4 2 "57/82/6d"
    print_osc4 3 "6d/82/57"
    print_osc4 4 "6d/57/82"
    print_osc4 5 "82/57/6d"
    print_osc4 6 "57/6d/82"
    print_osc4 7 "a3/9a/90"
    print_osc4 8 "5a/50/47"
    print_osc4 9 "82/6d/57"
    print_osc4 10 "57/82/6d"
    print_osc4 11 "6d/82/57"
    print_osc4 12 "6d/57/82"
    print_osc4 13 "82/57/6d"
    print_osc4 14 "57/6d/82"
    print_osc4 15 "db/d6/d1"

    print_osc_rgb 10 "a3/9a/90"
    print_osc_rgb 11 "16/13/0f"
    print_osc_rgb 12 "a3/9a/90"
    print_osc_rgb 17 "be/b6/ae"
    print_osc_rgb 19 "2c/26/20"
}

do_linux() {
    print_linux 0 "#16130f"
    print_linux 1 "#826d57"
    print_linux 2 "#57826d"
    print_linux 3 "#6d8257"
    print_linux 4 "#6d5782"
    print_linux 5 "#82576d"
    print_linux 6 "#576d82"
    print_linux 7 "#a39a90"
    print_linux 8 "#5a5047"
    print_linux 9 "#826d57"
    print_linux 10 "#57826d"
    print_linux 11 "#6d8257"
    print_linux 12 "#6d5782"
    print_linux 13 "#82576d"
    print_linux 14 "#576d82"
    print_linux 15 "#dbd6d1"
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
