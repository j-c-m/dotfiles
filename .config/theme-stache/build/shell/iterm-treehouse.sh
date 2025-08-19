#!/usr/bin/env bash

# Source:   iterm
# Theme:    Treehouse
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "32/12/00"
    print_osc4 1 "b1/27/0e"
    print_osc4 2 "44/a9/00"
    print_osc4 3 "a9/81/0b"
    print_osc4 4 "57/84/99"
    print_osc4 5 "96/36/3c"
    print_osc4 6 "b2/59/1d"
    print_osc4 7 "77/6b/53"
    print_osc4 8 "42/36/25"
    print_osc4 9 "ed/5c/20"
    print_osc4 10 "55/f2/37"
    print_osc4 11 "f1/b7/31"
    print_osc4 12 "85/cf/ec"
    print_osc4 13 "e0/4b/5a"
    print_osc4 14 "f0/7d/14"
    print_osc4 15 "ff/c8/00"

    print_osc_rgb 10 "77/6b/53"
    print_osc_rgb 11 "19/19/19"
    print_osc_rgb 12 "fa/c8/14"
    print_osc_rgb 17 "77/6b/53"
    print_osc_rgb 19 "fa/c8/00"
}

do_linux() {
    print_linux 0 "#321200"
    print_linux 1 "#b1270e"
    print_linux 2 "#44a900"
    print_linux 3 "#a9810b"
    print_linux 4 "#578499"
    print_linux 5 "#96363c"
    print_linux 6 "#b2591d"
    print_linux 7 "#776b53"
    print_linux 8 "#423625"
    print_linux 9 "#ed5c20"
    print_linux 10 "#55f237"
    print_linux 11 "#f1b731"
    print_linux 12 "#85cfec"
    print_linux 13 "#e04b5a"
    print_linux 14 "#f07d14"
    print_linux 15 "#ffc800"
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
