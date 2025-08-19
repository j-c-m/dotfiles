#!/usr/bin/env bash

# Source:   gogh
# Theme:    Seoul256
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "4e/4e/4e"
    print_osc4 1 "d6/87/87"
    print_osc4 2 "5f/86/5f"
    print_osc4 3 "d8/af/5f"
    print_osc4 4 "85/ad/d4"
    print_osc4 5 "d7/af/af"
    print_osc4 6 "87/af/af"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "62/62/62"
    print_osc4 9 "d7/5f/87"
    print_osc4 10 "87/af/87"
    print_osc4 11 "ff/d7/87"
    print_osc4 12 "ad/d4/fb"
    print_osc4 13 "ff/af/af"
    print_osc4 14 "87/d7/d7"
    print_osc4 15 "e4/e4/e4"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "3a/3a/3a"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "d0/d0/d0"
    print_osc_rgb 19 "3a/3a/3a"
}

do_linux() {
    print_linux 0 "#4e4e4e"
    print_linux 1 "#d68787"
    print_linux 2 "#5f865f"
    print_linux 3 "#d8af5f"
    print_linux 4 "#85add4"
    print_linux 5 "#d7afaf"
    print_linux 6 "#87afaf"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#626262"
    print_linux 9 "#d75f87"
    print_linux 10 "#87af87"
    print_linux 11 "#ffd787"
    print_linux 12 "#add4fb"
    print_linux 13 "#ffafaf"
    print_linux 14 "#87d7d7"
    print_linux 15 "#e4e4e4"
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
