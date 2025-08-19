#!/usr/bin/env bash

# Source:   gogh
# Theme:    Elementary
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
    print_osc4 0 "30/30/30"
    print_osc4 1 "e1/32/1a"
    print_osc4 2 "6a/b0/17"
    print_osc4 3 "ff/c0/05"
    print_osc4 4 "00/4f/9e"
    print_osc4 5 "ec/00/48"
    print_osc4 6 "2a/a7/e7"
    print_osc4 7 "f2/f2/f2"
    print_osc4 8 "5d/5d/5d"
    print_osc4 9 "ff/36/1e"
    print_osc4 10 "7b/c9/1f"
    print_osc4 11 "ff/d0/0a"
    print_osc4 12 "00/71/ff"
    print_osc4 13 "ff/1d/62"
    print_osc4 14 "4b/b8/fd"
    print_osc4 15 "a0/20/f0"

    print_osc_rgb 10 "f2/f2/f2"
    print_osc_rgb 11 "10/10/10"
    print_osc_rgb 12 "f2/f2/f2"
    print_osc_rgb 17 "f2/f2/f2"
    print_osc_rgb 19 "10/10/10"
}

do_linux() {
    print_linux 0 "#303030"
    print_linux 1 "#e1321a"
    print_linux 2 "#6ab017"
    print_linux 3 "#ffc005"
    print_linux 4 "#004f9e"
    print_linux 5 "#ec0048"
    print_linux 6 "#2aa7e7"
    print_linux 7 "#f2f2f2"
    print_linux 8 "#5d5d5d"
    print_linux 9 "#ff361e"
    print_linux 10 "#7bc91f"
    print_linux 11 "#ffd00a"
    print_linux 12 "#0071ff"
    print_linux 13 "#ff1d62"
    print_linux 14 "#4bb8fd"
    print_linux 15 "#a020f0"
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
