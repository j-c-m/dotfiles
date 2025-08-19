#!/usr/bin/env bash

# Source:   base16
# Theme:    Penumbra Light Contrast Plus
# Author:   Zachary Weiss (https://github.com/zacharyweiss)
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
    print_osc4 0 "ff/fd/fb"
    print_osc4 1 "df/7f/78"
    print_osc4 2 "50/b5/84"
    print_osc4 3 "9c/a7/48"
    print_osc4 4 "61/a3/e6"
    print_osc4 5 "a4/8f/e1"
    print_osc4 6 "00/b3/c2"
    print_osc4 7 "63/63/63"
    print_osc4 8 "ce/ce/ce"
    print_osc4 9 "df/7f/78"
    print_osc4 10 "50/b5/84"
    print_osc4 11 "9c/a7/48"
    print_osc4 12 "61/a3/e6"
    print_osc4 13 "a4/8f/e1"
    print_osc4 14 "00/b3/c2"
    print_osc4 15 "18/1b/1f"

    print_osc_rgb 10 "63/63/63"
    print_osc_rgb 11 "ff/fd/fb"
    print_osc_rgb 12 "63/63/63"
    print_osc_rgb 17 "24/27/2b"
    print_osc_rgb 19 "ff/f7/ed"
}

do_linux() {
    print_linux 0 "#fffdfb"
    print_linux 1 "#df7f78"
    print_linux 2 "#50b584"
    print_linux 3 "#9ca748"
    print_linux 4 "#61a3e6"
    print_linux 5 "#a48fe1"
    print_linux 6 "#00b3c2"
    print_linux 7 "#636363"
    print_linux 8 "#cecece"
    print_linux 9 "#df7f78"
    print_linux 10 "#50b584"
    print_linux 11 "#9ca748"
    print_linux 12 "#61a3e6"
    print_linux 13 "#a48fe1"
    print_linux 14 "#00b3c2"
    print_linux 15 "#181b1f"
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
