#!/usr/bin/env bash

# Source:   gogh
# Theme:    Liquid Carbon Transparent
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/30/30"
    print_osc4 2 "55/9a/70"
    print_osc4 3 "cc/ac/00"
    print_osc4 4 "00/99/cc"
    print_osc4 5 "cc/69/c8"
    print_osc4 6 "7a/c4/cc"
    print_osc4 7 "bc/cc/cc"
    print_osc4 8 "00/00/00"
    print_osc4 9 "ff/30/30"
    print_osc4 10 "55/9a/70"
    print_osc4 11 "cc/ac/00"
    print_osc4 12 "00/99/cc"
    print_osc4 13 "cc/69/c8"
    print_osc4 14 "7a/c4/cc"
    print_osc4 15 "bc/cc/cc"

    print_osc_rgb 10 "af/c2/c2"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "af/c2/c2"
    print_osc_rgb 17 "af/c2/c2"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff3030"
    print_linux 2 "#559a70"
    print_linux 3 "#ccac00"
    print_linux 4 "#0099cc"
    print_linux 5 "#cc69c8"
    print_linux 6 "#7ac4cc"
    print_linux 7 "#afc2c2"
    print_linux 8 "#000000"
    print_linux 9 "#ff3030"
    print_linux 10 "#559a70"
    print_linux 11 "#ccac00"
    print_linux 12 "#0099cc"
    print_linux 13 "#cc69c8"
    print_linux 14 "#7ac4cc"
    print_linux 15 "#bccccc"
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
