#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Pro
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "2d/2a/2e"
    print_osc4 1 "ff/61/88"
    print_osc4 2 "a9/dc/76"
    print_osc4 3 "ff/d8/66"
    print_osc4 4 "fc/98/67"
    print_osc4 5 "ab/9d/f2"
    print_osc4 6 "78/dc/e8"
    print_osc4 7 "fc/fc/fa"
    print_osc4 8 "90/8e/8f"
    print_osc4 9 "ff/61/88"
    print_osc4 10 "a9/dc/76"
    print_osc4 11 "ff/d8/66"
    print_osc4 12 "fc/98/67"
    print_osc4 13 "ab/9d/f2"
    print_osc4 14 "78/dc/e8"
    print_osc4 15 "fc/fc/fa"

    print_osc_rgb 10 "fc/fc/fa"
    print_osc_rgb 11 "2d/2a/2e"
    print_osc_rgb 12 "fc/fc/fa"
    print_osc_rgb 17 "fc/fc/fa"
    print_osc_rgb 19 "2d/2a/2e"
}

do_linux() {
    print_linux 0 "#2d2a2e"
    print_linux 1 "#ff6188"
    print_linux 2 "#a9dc76"
    print_linux 3 "#ffd866"
    print_linux 4 "#fc9867"
    print_linux 5 "#ab9df2"
    print_linux 6 "#78dce8"
    print_linux 7 "#fcfcfa"
    print_linux 8 "#908e8f"
    print_linux 9 "#ff6188"
    print_linux 10 "#a9dc76"
    print_linux 11 "#ffd866"
    print_linux 12 "#fc9867"
    print_linux 13 "#ab9df2"
    print_linux 14 "#78dce8"
    print_linux 15 "#fcfcfa"
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
