#!/usr/bin/env bash

# Source:   iterm
# Theme:    Broadcast
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "da/49/39"
    print_osc4 2 "51/9f/50"
    print_osc4 3 "ff/d2/4a"
    print_osc4 4 "6d/9c/be"
    print_osc4 5 "d0/d0/ff"
    print_osc4 6 "6e/9c/be"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "32/32/32"
    print_osc4 9 "ff/7b/6b"
    print_osc4 10 "83/d1/82"
    print_osc4 11 "ff/ff/7c"
    print_osc4 12 "9f/ce/f0"
    print_osc4 13 "ff/ff/ff"
    print_osc4 14 "a0/ce/f0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e6/e1/dc"
    print_osc_rgb 11 "2b/2b/2b"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "5a/64/7e"
    print_osc_rgb 19 "e6/e1/dc"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#da4939"
    print_linux 2 "#519f50"
    print_linux 3 "#ffd24a"
    print_linux 4 "#6d9cbe"
    print_linux 5 "#d0d0ff"
    print_linux 6 "#6e9cbe"
    print_linux 7 "#e6e1dc"
    print_linux 8 "#323232"
    print_linux 9 "#ff7b6b"
    print_linux 10 "#83d182"
    print_linux 11 "#ffff7c"
    print_linux 12 "#9fcef0"
    print_linux 13 "#ffffff"
    print_linux 14 "#a0cef0"
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
