#!/usr/bin/env bash

# Source:   base16
# Theme:    Tokyodark Terminal
# Author:   Tiagovla (https://github.com/tiagovla/)
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
    print_osc4 0 "11/12/1d"
    print_osc4 1 "ee/6d/85"
    print_osc4 2 "95/c5/61"
    print_osc4 3 "d7/a6/5f"
    print_osc4 4 "71/99/ee"
    print_osc4 5 "a4/85/dd"
    print_osc4 6 "38/a8/9d"
    print_osc4 7 "a0/a8/cd"
    print_osc4 8 "28/2c/34"
    print_osc4 9 "ee/6d/85"
    print_osc4 10 "95/c5/61"
    print_osc4 11 "d7/a6/5f"
    print_osc4 12 "71/99/ee"
    print_osc4 13 "a4/85/dd"
    print_osc4 14 "38/a8/9d"
    print_osc4 15 "a0/a8/cd"

    print_osc_rgb 10 "a0/a8/cd"
    print_osc_rgb 11 "11/12/1d"
    print_osc_rgb 12 "a0/a8/cd"
    print_osc_rgb 17 "a0/a8/cd"
    print_osc_rgb 19 "1a/1b/2a"
}

do_linux() {
    print_linux 0 "#11121d"
    print_linux 1 "#ee6d85"
    print_linux 2 "#95c561"
    print_linux 3 "#d7a65f"
    print_linux 4 "#7199ee"
    print_linux 5 "#a485dd"
    print_linux 6 "#38a89d"
    print_linux 7 "#a0a8cd"
    print_linux 8 "#282c34"
    print_linux 9 "#ee6d85"
    print_linux 10 "#95c561"
    print_linux 11 "#d7a65f"
    print_linux 12 "#7199ee"
    print_linux 13 "#a485dd"
    print_linux 14 "#38a89d"
    print_linux 15 "#a0a8cd"
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
