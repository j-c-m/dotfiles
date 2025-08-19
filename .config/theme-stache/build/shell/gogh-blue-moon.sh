#!/usr/bin/env bash

# Source:   gogh
# Theme:    Blue Moon
# Author:   kyazdani42 (https://github.com/kyazdani42/blue-moon)
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
    print_osc4 0 "35/3b/52"
    print_osc4 1 "d0/61/78"
    print_osc4 2 "b4/c4/b4"
    print_osc4 3 "cf/cf/bf"
    print_osc4 4 "95/9d/cb"
    print_osc4 5 "b9/a3/eb"
    print_osc4 6 "89/bb/dd"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "87/96/b0"
    print_osc4 9 "e6/1f/44"
    print_osc4 10 "ac/fa/b4"
    print_osc4 11 "df/df/9f"
    print_osc4 12 "b8/bc/f3"
    print_osc4 13 "b9/a3/eb"
    print_osc4 14 "89/dd/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "67/6e/96"
    print_osc_rgb 11 "1b/1e/2b"
    print_osc_rgb 12 "67/6e/96"
    print_osc_rgb 17 "67/6e/96"
    print_osc_rgb 19 "1b/1e/2b"
}

do_linux() {
    print_linux 0 "#353b52"
    print_linux 1 "#d06178"
    print_linux 2 "#b4c4b4"
    print_linux 3 "#cfcfbf"
    print_linux 4 "#959dcb"
    print_linux 5 "#b9a3eb"
    print_linux 6 "#89bbdd"
    print_linux 7 "#676e96"
    print_linux 8 "#8796b0"
    print_linux 9 "#e61f44"
    print_linux 10 "#acfab4"
    print_linux 11 "#dfdf9f"
    print_linux 12 "#b8bcf3"
    print_linux 13 "#b9a3eb"
    print_linux 14 "#89ddff"
    print_linux 15 "#ffffff"
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
