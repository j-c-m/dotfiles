#!/usr/bin/env bash

# Source:   iterm
# Theme:    Seti
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
    print_osc4 0 "32/32/32"
    print_osc4 1 "c2/28/32"
    print_osc4 2 "8e/c4/3d"
    print_osc4 3 "e0/c6/4f"
    print_osc4 4 "43/a5/d5"
    print_osc4 5 "8b/57/b5"
    print_osc4 6 "8e/c4/3d"
    print_osc4 7 "ee/ee/ee"
    print_osc4 8 "32/32/32"
    print_osc4 9 "c2/28/32"
    print_osc4 10 "8e/c4/3d"
    print_osc4 11 "e0/c6/4f"
    print_osc4 12 "43/a5/d5"
    print_osc4 13 "8b/57/b5"
    print_osc4 14 "8e/c4/3d"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ca/ce/cd"
    print_osc_rgb 11 "11/12/13"
    print_osc_rgb 12 "e2/be/21"
    print_osc_rgb 17 "30/32/33"
    print_osc_rgb 19 "ca/ce/cd"
}

do_linux() {
    print_linux 0 "#323232"
    print_linux 1 "#c22832"
    print_linux 2 "#8ec43d"
    print_linux 3 "#e0c64f"
    print_linux 4 "#43a5d5"
    print_linux 5 "#8b57b5"
    print_linux 6 "#8ec43d"
    print_linux 7 "#cacecd"
    print_linux 8 "#323232"
    print_linux 9 "#c22832"
    print_linux 10 "#8ec43d"
    print_linux 11 "#e0c64f"
    print_linux 12 "#43a5d5"
    print_linux 13 "#8b57b5"
    print_linux 14 "#8ec43d"
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
