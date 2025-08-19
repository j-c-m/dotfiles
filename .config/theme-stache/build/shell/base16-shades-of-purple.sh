#!/usr/bin/env bash

# Source:   base16
# Theme:    Shades of Purple
# Author:   Iolar Demartini Junior (http://github.com/demartini), based on Shades of Purple Theme (https://github.com/ahmadawais/shades-of-purple-vscode)
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
    print_osc4 0 "1e/1e/3f"
    print_osc4 1 "d9/04/29"
    print_osc4 2 "3a/d9/00"
    print_osc4 3 "ff/e7/00"
    print_osc4 4 "69/43/ff"
    print_osc4 5 "ff/2c/70"
    print_osc4 6 "00/c5/c7"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "80/80/80"
    print_osc4 9 "d9/04/29"
    print_osc4 10 "3a/d9/00"
    print_osc4 11 "ff/e7/00"
    print_osc4 12 "69/43/ff"
    print_osc4 13 "ff/2c/70"
    print_osc4 14 "00/c5/c7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c7/c7/c7"
    print_osc_rgb 11 "1e/1e/3f"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "ff/77/ff"
    print_osc_rgb 19 "43/d4/26"
}

do_linux() {
    print_linux 0 "#1e1e3f"
    print_linux 1 "#d90429"
    print_linux 2 "#3ad900"
    print_linux 3 "#ffe700"
    print_linux 4 "#6943ff"
    print_linux 5 "#ff2c70"
    print_linux 6 "#00c5c7"
    print_linux 7 "#c7c7c7"
    print_linux 8 "#808080"
    print_linux 9 "#d90429"
    print_linux 10 "#3ad900"
    print_linux 11 "#ffe700"
    print_linux 12 "#6943ff"
    print_linux 13 "#ff2c70"
    print_linux 14 "#00c5c7"
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
