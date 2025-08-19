#!/usr/bin/env bash

# Source:   base24
# Theme:    Solarized Dark Patched
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "00/1e/26"
    print_osc4 1 "d0/1b/24"
    print_osc4 2 "72/89/05"
    print_osc4 3 "70/81/83"
    print_osc4 4 "20/75/c7"
    print_osc4 5 "c6/1b/6e"
    print_osc4 6 "25/91/85"
    print_osc4 7 "c0/c0/b0"
    print_osc4 8 "6e/7c/7b"
    print_osc4 9 "bd/36/12"
    print_osc4 10 "46/5a/61"
    print_osc4 11 "52/67/6f"
    print_osc4 12 "70/81/83"
    print_osc4 13 "58/56/b9"
    print_osc4 14 "81/90/8f"
    print_osc4 15 "fc/f4/dc"

    print_osc_rgb 10 "c0/c0/b0"
    print_osc_rgb 11 "00/1e/26"
    print_osc_rgb 12 "c0/c0/b0"
    print_osc_rgb 17 "e9/e2/cb"
    print_osc_rgb 19 "00/27/31"
}

do_linux() {
    print_linux 0 "#001e26"
    print_linux 1 "#d01b24"
    print_linux 2 "#728905"
    print_linux 3 "#708183"
    print_linux 4 "#2075c7"
    print_linux 5 "#c61b6e"
    print_linux 6 "#259185"
    print_linux 7 "#c0c0b0"
    print_linux 8 "#6e7c7b"
    print_linux 9 "#bd3612"
    print_linux 10 "#465a61"
    print_linux 11 "#52676f"
    print_linux 12 "#708183"
    print_linux 13 "#5856b9"
    print_linux 14 "#81908f"
    print_linux 15 "#fcf4dc"
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
