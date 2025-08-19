#!/usr/bin/env bash

# Source:   base16
# Theme:    Tokyo City Dark
# Author:   Michaël Ball
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
    print_osc4 0 "17/1d/23"
    print_osc4 1 "f7/76/8e"
    print_osc4 2 "9e/ce/6a"
    print_osc4 3 "b7/c5/d3"
    print_osc4 4 "7a/a2/f7"
    print_osc4 5 "bb/9a/f7"
    print_osc4 6 "89/dd/ff"
    print_osc4 7 "d8/e2/ec"
    print_osc4 8 "52/62/70"
    print_osc4 9 "f7/76/8e"
    print_osc4 10 "9e/ce/6a"
    print_osc4 11 "b7/c5/d3"
    print_osc4 12 "7a/a2/f7"
    print_osc4 13 "bb/9a/f7"
    print_osc4 14 "89/dd/ff"
    print_osc4 15 "fb/fb/fd"

    print_osc_rgb 10 "d8/e2/ec"
    print_osc_rgb 11 "17/1d/23"
    print_osc_rgb 12 "d8/e2/ec"
    print_osc_rgb 17 "f6/f6/f8"
    print_osc_rgb 19 "1d/25/2c"
}

do_linux() {
    print_linux 0 "#171d23"
    print_linux 1 "#f7768e"
    print_linux 2 "#9ece6a"
    print_linux 3 "#b7c5d3"
    print_linux 4 "#7aa2f7"
    print_linux 5 "#bb9af7"
    print_linux 6 "#89ddff"
    print_linux 7 "#d8e2ec"
    print_linux 8 "#526270"
    print_linux 9 "#f7768e"
    print_linux 10 "#9ece6a"
    print_linux 11 "#b7c5d3"
    print_linux 12 "#7aa2f7"
    print_linux 13 "#bb9af7"
    print_linux 14 "#89ddff"
    print_linux 15 "#fbfbfd"
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
