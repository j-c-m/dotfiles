#!/usr/bin/env bash

# Source:   base24
# Theme:    Shades Of Purple
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "1e/1d/40"
    print_osc4 1 "d9/04/29"
    print_osc4 2 "3a/d9/00"
    print_osc4 3 "68/71/ff"
    print_osc4 4 "69/43/ff"
    print_osc4 5 "ff/2b/70"
    print_osc4 6 "00/c5/c7"
    print_osc4 7 "af/af/af"
    print_osc4 8 "7f/7f/7f"
    print_osc4 9 "f9/29/1b"
    print_osc4 10 "42/d4/25"
    print_osc4 11 "f1/d0/00"
    print_osc4 12 "68/71/ff"
    print_osc4 13 "ff/76/ff"
    print_osc4 14 "79/e7/fa"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "af/af/af"
    print_osc_rgb 11 "1e/1d/40"
    print_osc_rgb 12 "af/af/af"
    print_osc_rgb 17 "c7/c7/c7"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#1e1d40"
    print_linux 1 "#d90429"
    print_linux 2 "#3ad900"
    print_linux 3 "#6871ff"
    print_linux 4 "#6943ff"
    print_linux 5 "#ff2b70"
    print_linux 6 "#00c5c7"
    print_linux 7 "#afafaf"
    print_linux 8 "#7f7f7f"
    print_linux 9 "#f9291b"
    print_linux 10 "#42d425"
    print_linux 11 "#f1d000"
    print_linux 12 "#6871ff"
    print_linux 13 "#ff76ff"
    print_linux 14 "#79e7fa"
    print_linux 15 "#feffff"
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
