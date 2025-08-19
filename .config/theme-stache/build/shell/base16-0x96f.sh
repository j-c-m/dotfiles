#!/usr/bin/env bash

# Source:   base16
# Theme:    0x96f
# Author:   Filip Janevski (https://0x96f.dev/theme)
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
    print_osc4 0 "26/24/27"
    print_osc4 1 "ff/72/72"
    print_osc4 2 "bc/df/59"
    print_osc4 3 "ff/ca/58"
    print_osc4 4 "49/ca/e4"
    print_osc4 5 "a0/93/e2"
    print_osc4 6 "ae/e8/f4"
    print_osc4 7 "fc/fc/fc"
    print_osc4 8 "67/65/67"
    print_osc4 9 "ff/72/72"
    print_osc4 10 "bc/df/59"
    print_osc4 11 "ff/ca/58"
    print_osc4 12 "49/ca/e4"
    print_osc4 13 "a0/93/e2"
    print_osc4 14 "ae/e8/f4"
    print_osc4 15 "fc/fc/fc"

    print_osc_rgb 10 "fc/fc/fc"
    print_osc_rgb 11 "26/24/27"
    print_osc_rgb 12 "fc/fc/fc"
    print_osc_rgb 17 "ea/e9/eb"
    print_osc_rgb 19 "3b/39/3c"
}

do_linux() {
    print_linux 0 "#262427"
    print_linux 1 "#ff7272"
    print_linux 2 "#bcdf59"
    print_linux 3 "#ffca58"
    print_linux 4 "#49cae4"
    print_linux 5 "#a093e2"
    print_linux 6 "#aee8f4"
    print_linux 7 "#fcfcfc"
    print_linux 8 "#676567"
    print_linux 9 "#ff7272"
    print_linux 10 "#bcdf59"
    print_linux 11 "#ffca58"
    print_linux 12 "#49cae4"
    print_linux 13 "#a093e2"
    print_linux 14 "#aee8f4"
    print_linux 15 "#fcfcfc"
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
