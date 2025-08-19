#!/usr/bin/env bash

# Source:   base16
# Theme:    Ocean
# Author:   Chris Kempson (http://chriskempson.com)
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
    print_osc4 0 "2b/30/3b"
    print_osc4 1 "bf/61/6a"
    print_osc4 2 "a3/be/8c"
    print_osc4 3 "eb/cb/8b"
    print_osc4 4 "8f/a1/b3"
    print_osc4 5 "b4/8e/ad"
    print_osc4 6 "96/b5/b4"
    print_osc4 7 "c0/c5/ce"
    print_osc4 8 "65/73/7e"
    print_osc4 9 "bf/61/6a"
    print_osc4 10 "a3/be/8c"
    print_osc4 11 "eb/cb/8b"
    print_osc4 12 "8f/a1/b3"
    print_osc4 13 "b4/8e/ad"
    print_osc4 14 "96/b5/b4"
    print_osc4 15 "ef/f1/f5"

    print_osc_rgb 10 "c0/c5/ce"
    print_osc_rgb 11 "2b/30/3b"
    print_osc_rgb 12 "c0/c5/ce"
    print_osc_rgb 17 "df/e1/e8"
    print_osc_rgb 19 "34/3d/46"
}

do_linux() {
    print_linux 0 "#2b303b"
    print_linux 1 "#bf616a"
    print_linux 2 "#a3be8c"
    print_linux 3 "#ebcb8b"
    print_linux 4 "#8fa1b3"
    print_linux 5 "#b48ead"
    print_linux 6 "#96b5b4"
    print_linux 7 "#c0c5ce"
    print_linux 8 "#65737e"
    print_linux 9 "#bf616a"
    print_linux 10 "#a3be8c"
    print_linux 11 "#ebcb8b"
    print_linux 12 "#8fa1b3"
    print_linux 13 "#b48ead"
    print_linux 14 "#96b5b4"
    print_linux 15 "#eff1f5"
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
