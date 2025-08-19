#!/usr/bin/env bash

# Source:   base16
# Theme:    Horizon Dark
# Author:   Michaël Ball (http://github.com/michael-ball/)
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
    print_osc4 0 "1c/1e/26"
    print_osc4 1 "e9/3c/58"
    print_osc4 2 "ef/af/8e"
    print_osc4 3 "ef/b9/93"
    print_osc4 4 "df/52/73"
    print_osc4 5 "b0/72/d1"
    print_osc4 6 "24/a8/b4"
    print_osc4 7 "cb/ce/d0"
    print_osc4 8 "6f/6f/70"
    print_osc4 9 "e9/3c/58"
    print_osc4 10 "ef/af/8e"
    print_osc4 11 "ef/b9/93"
    print_osc4 12 "df/52/73"
    print_osc4 13 "b0/72/d1"
    print_osc4 14 "24/a8/b4"
    print_osc4 15 "e3/e6/ee"

    print_osc_rgb 10 "cb/ce/d0"
    print_osc_rgb 11 "1c/1e/26"
    print_osc_rgb 12 "cb/ce/d0"
    print_osc_rgb 17 "dc/df/e4"
    print_osc_rgb 19 "23/25/30"
}

do_linux() {
    print_linux 0 "#1c1e26"
    print_linux 1 "#e93c58"
    print_linux 2 "#efaf8e"
    print_linux 3 "#efb993"
    print_linux 4 "#df5273"
    print_linux 5 "#b072d1"
    print_linux 6 "#24a8b4"
    print_linux 7 "#cbced0"
    print_linux 8 "#6f6f70"
    print_linux 9 "#e93c58"
    print_linux 10 "#efaf8e"
    print_linux 11 "#efb993"
    print_linux 12 "#df5273"
    print_linux 13 "#b072d1"
    print_linux 14 "#24a8b4"
    print_linux 15 "#e3e6ee"
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
