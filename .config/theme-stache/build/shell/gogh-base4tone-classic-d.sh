#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic D
# Author:   
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
    print_osc4 0 "21/21/1c"
    print_osc4 1 "04/95/82"
    print_osc4 2 "da/6b/2b"
    print_osc4 3 "ee/99/68"
    print_osc4 4 "cf/b6/17"
    print_osc4 5 "82/c1/15"
    print_osc4 6 "e6/85/4d"
    print_osc4 7 "ee/ed/e8"
    print_osc4 8 "0d/0c/07"
    print_osc4 9 "1c/c4/ae"
    print_osc4 10 "f0/a5/7a"
    print_osc4 11 "f5/c1/a3"
    print_osc4 12 "f6/ed/b1"
    print_osc4 13 "95/dc/18"
    print_osc4 14 "f2/e5/8c"
    print_osc4 15 "f9/f8/f6"

    print_osc_rgb 10 "a2/a0/90"
    print_osc_rgb 11 "21/21/1c"
    print_osc_rgb 12 "85/77/6f"
    print_osc_rgb 17 "a2/a0/90"
    print_osc_rgb 19 "21/21/1c"
}

do_linux() {
    print_linux 0 "#21211c"
    print_linux 1 "#049582"
    print_linux 2 "#da6b2b"
    print_linux 3 "#ee9968"
    print_linux 4 "#cfb617"
    print_linux 5 "#82c115"
    print_linux 6 "#e6854d"
    print_linux 7 "#a2a090"
    print_linux 8 "#0d0c07"
    print_linux 9 "#1cc4ae"
    print_linux 10 "#f0a57a"
    print_linux 11 "#f5c1a3"
    print_linux 12 "#f6edb1"
    print_linux 13 "#95dc18"
    print_linux 14 "#f2e58c"
    print_linux 15 "#f9f8f6"
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
