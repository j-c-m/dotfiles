#!/usr/bin/env bash

# Source:   iterm
# Theme:    primary
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
    print_osc4 1 "db/44/37"
    print_osc4 2 "0f/9d/58"
    print_osc4 3 "f4/b4/00"
    print_osc4 4 "42/85/f4"
    print_osc4 5 "db/44/37"
    print_osc4 6 "42/85/f4"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "db/44/37"
    print_osc4 10 "0f/9d/58"
    print_osc4 11 "f4/b4/00"
    print_osc4 12 "42/85/f4"
    print_osc4 13 "42/85/f4"
    print_osc4 14 "0f/9d/58"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "65/65/65"
    print_osc_rgb 19 "ee/ee/ee"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#db4437"
    print_linux 2 "#0f9d58"
    print_linux 3 "#f4b400"
    print_linux 4 "#4285f4"
    print_linux 5 "#db4437"
    print_linux 6 "#4285f4"
    print_linux 7 "#000000"
    print_linux 8 "#000000"
    print_linux 9 "#db4437"
    print_linux 10 "#0f9d58"
    print_linux 11 "#f4b400"
    print_linux 12 "#4285f4"
    print_linux 13 "#4285f4"
    print_linux 14 "#0f9d58"
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
