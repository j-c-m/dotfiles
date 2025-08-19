#!/usr/bin/env bash

# Source:   base16
# Theme:    Dark Violet
# Author:   ruler501 (https://github.com/ruler501/base16-darkviolet)
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "a8/2e/e6"
    print_osc4 2 "45/95/e6"
    print_osc4 3 "f2/9d/f2"
    print_osc4 4 "41/36/d9"
    print_osc4 5 "7e/5c/e6"
    print_osc4 6 "40/df/ff"
    print_osc4 7 "b0/8a/e6"
    print_osc4 8 "59/33/80"
    print_osc4 9 "a8/2e/e6"
    print_osc4 10 "45/95/e6"
    print_osc4 11 "f2/9d/f2"
    print_osc4 12 "41/36/d9"
    print_osc4 13 "7e/5c/e6"
    print_osc4 14 "40/df/ff"
    print_osc4 15 "a3/66/ff"

    print_osc_rgb 10 "b0/8a/e6"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "b0/8a/e6"
    print_osc_rgb 17 "90/45/e6"
    print_osc_rgb 19 "23/1a/40"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#a82ee6"
    print_linux 2 "#4595e6"
    print_linux 3 "#f29df2"
    print_linux 4 "#4136d9"
    print_linux 5 "#7e5ce6"
    print_linux 6 "#40dfff"
    print_linux 7 "#b08ae6"
    print_linux 8 "#593380"
    print_linux 9 "#a82ee6"
    print_linux 10 "#4595e6"
    print_linux 11 "#f29df2"
    print_linux 12 "#4136d9"
    print_linux 13 "#7e5ce6"
    print_linux 14 "#40dfff"
    print_linux 15 "#a366ff"
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
