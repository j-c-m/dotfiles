#!/usr/bin/env bash

# Source:   gogh
# Theme:    Pali
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
    print_osc4 0 "0a/0a/0a"
    print_osc4 1 "ab/8f/74"
    print_osc4 2 "74/ab/8f"
    print_osc4 3 "8f/ab/74"
    print_osc4 4 "8f/74/ab"
    print_osc4 5 "ab/74/8f"
    print_osc4 6 "74/8f/ab"
    print_osc4 7 "f2/f2/f2"
    print_osc4 8 "5d/5d/5d"
    print_osc4 9 "ff/1d/62"
    print_osc4 10 "9c/c3/af"
    print_osc4 11 "ff/d0/0a"
    print_osc4 12 "af/9c/c3"
    print_osc4 13 "ff/1d/62"
    print_osc4 14 "4b/b8/fd"
    print_osc4 15 "a0/20/f0"

    print_osc_rgb 10 "d9/e6/f2"
    print_osc_rgb 11 "23/2e/37"
    print_osc_rgb 12 "d9/e6/f2"
    print_osc_rgb 17 "d9/e6/f2"
    print_osc_rgb 19 "23/2e/37"
}

do_linux() {
    print_linux 0 "#0a0a0a"
    print_linux 1 "#ab8f74"
    print_linux 2 "#74ab8f"
    print_linux 3 "#8fab74"
    print_linux 4 "#8f74ab"
    print_linux 5 "#ab748f"
    print_linux 6 "#748fab"
    print_linux 7 "#d9e6f2"
    print_linux 8 "#5d5d5d"
    print_linux 9 "#ff1d62"
    print_linux 10 "#9cc3af"
    print_linux 11 "#ffd00a"
    print_linux 12 "#af9cc3"
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
