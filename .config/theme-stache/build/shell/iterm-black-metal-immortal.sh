#!/usr/bin/env bash

# Source:   iterm
# Theme:    Black Metal (Immortal)
# Author:   unknown
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "5e/86/86"
    print_osc4 2 "77/99/ba"
    print_osc4 3 "54/66/77"
    print_osc4 4 "87/87/87"
    print_osc4 5 "99/99/99"
    print_osc4 6 "aa/aa/aa"
    print_osc4 7 "c1/c1/c1"
    print_osc4 8 "33/33/33"
    print_osc4 9 "5e/86/86"
    print_osc4 10 "77/99/ba"
    print_osc4 11 "54/66/77"
    print_osc4 12 "87/87/87"
    print_osc4 13 "99/99/99"
    print_osc4 14 "aa/aa/aa"
    print_osc4 15 "c1/c1/c1"

    print_osc_rgb 10 "c1/c1/c1"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "c1/c1/c1"
    print_osc_rgb 17 "c1/c1/c1"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#5e8686"
    print_linux 2 "#7799ba"
    print_linux 3 "#546677"
    print_linux 4 "#878787"
    print_linux 5 "#999999"
    print_linux 6 "#aaaaaa"
    print_linux 7 "#c1c1c1"
    print_linux 8 "#333333"
    print_linux 9 "#5e8686"
    print_linux 10 "#7799ba"
    print_linux 11 "#546677"
    print_linux 12 "#878787"
    print_linux 13 "#999999"
    print_linux 14 "#aaaaaa"
    print_linux 15 "#c1c1c1"
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
