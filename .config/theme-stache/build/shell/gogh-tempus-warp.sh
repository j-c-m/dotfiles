#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Warp
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "00/15/14"
    print_osc4 1 "ff/37/37"
    print_osc4 2 "16/9c/16"
    print_osc4 3 "9f/85/00"
    print_osc4 4 "57/81/ef"
    print_osc4 5 "da/4e/bf"
    print_osc4 6 "00/98/80"
    print_osc4 7 "96/82/82"
    print_osc4 8 "26/1c/2c"
    print_osc4 9 "f0/68/1a"
    print_osc4 10 "3a/a7/3a"
    print_osc4 11 "ba/8a/00"
    print_osc4 12 "88/87/f0"
    print_osc4 13 "d8/5c/f2"
    print_osc4 14 "1d/a1/af"
    print_osc4 15 "a2/9f/a0"

    print_osc_rgb 10 "a2/9f/a0"
    print_osc_rgb 11 "00/15/14"
    print_osc_rgb 12 "a2/9f/a0"
    print_osc_rgb 17 "a2/9f/a0"
    print_osc_rgb 19 "00/15/14"
}

do_linux() {
    print_linux 0 "#001514"
    print_linux 1 "#ff3737"
    print_linux 2 "#169c16"
    print_linux 3 "#9f8500"
    print_linux 4 "#5781ef"
    print_linux 5 "#da4ebf"
    print_linux 6 "#009880"
    print_linux 7 "#a29fa0"
    print_linux 8 "#261c2c"
    print_linux 9 "#f0681a"
    print_linux 10 "#3aa73a"
    print_linux 11 "#ba8a00"
    print_linux 12 "#8887f0"
    print_linux 13 "#d85cf2"
    print_linux 14 "#1da1af"
    print_linux 15 "#a29fa0"
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
