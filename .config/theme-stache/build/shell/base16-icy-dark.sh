#!/usr/bin/env bash

# Source:   base16
# Theme:    Icy Dark
# Author:   icyphox (https://icyphox.ga)
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
    print_osc4 0 "02/10/12"
    print_osc4 1 "16/c1/d9"
    print_osc4 2 "4d/d0/e1"
    print_osc4 3 "80/de/ea"
    print_osc4 4 "00/bc/d4"
    print_osc4 5 "00/ac/c1"
    print_osc4 6 "26/c6/da"
    print_osc4 7 "09/5b/67"
    print_osc4 8 "05/2e/34"
    print_osc4 9 "16/c1/d9"
    print_osc4 10 "4d/d0/e1"
    print_osc4 11 "80/de/ea"
    print_osc4 12 "00/bc/d4"
    print_osc4 13 "00/ac/c1"
    print_osc4 14 "26/c6/da"
    print_osc4 15 "10/9c/b0"

    print_osc_rgb 10 "09/5b/67"
    print_osc_rgb 11 "02/10/12"
    print_osc_rgb 12 "09/5b/67"
    print_osc_rgb 17 "0c/7c/8c"
    print_osc_rgb 19 "03/16/19"
}

do_linux() {
    print_linux 0 "#021012"
    print_linux 1 "#16c1d9"
    print_linux 2 "#4dd0e1"
    print_linux 3 "#80deea"
    print_linux 4 "#00bcd4"
    print_linux 5 "#00acc1"
    print_linux 6 "#26c6da"
    print_linux 7 "#095b67"
    print_linux 8 "#052e34"
    print_linux 9 "#16c1d9"
    print_linux 10 "#4dd0e1"
    print_linux 11 "#80deea"
    print_linux 12 "#00bcd4"
    print_linux 13 "#00acc1"
    print_linux 14 "#26c6da"
    print_linux 15 "#109cb0"
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
