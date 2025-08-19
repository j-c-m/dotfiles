#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ayu Mirage
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
    print_osc4 0 "1f/24/30"
    print_osc4 1 "ff/33/33"
    print_osc4 2 "ba/e6/7e"
    print_osc4 3 "ff/a7/59"
    print_osc4 4 "73/d0/ff"
    print_osc4 5 "d4/bf/ff"
    print_osc4 6 "95/e6/cb"
    print_osc4 7 "cb/cc/c6"
    print_osc4 8 "70/7a/8c"
    print_osc4 9 "ff/33/33"
    print_osc4 10 "ba/e6/7e"
    print_osc4 11 "ff/a7/59"
    print_osc4 12 "73/d0/ff"
    print_osc4 13 "d4/bf/ff"
    print_osc4 14 "95/e6/cb"
    print_osc4 15 "cb/cc/c6"

    print_osc_rgb 10 "cb/cc/c6"
    print_osc_rgb 11 "1f/24/30"
    print_osc_rgb 12 "ff/cc/66"
    print_osc_rgb 17 "cb/cc/c6"
    print_osc_rgb 19 "1f/24/30"
}

do_linux() {
    print_linux 0 "#1f2430"
    print_linux 1 "#ff3333"
    print_linux 2 "#bae67e"
    print_linux 3 "#ffa759"
    print_linux 4 "#73d0ff"
    print_linux 5 "#d4bfff"
    print_linux 6 "#95e6cb"
    print_linux 7 "#cbccc6"
    print_linux 8 "#707a8c"
    print_linux 9 "#ff3333"
    print_linux 10 "#bae67e"
    print_linux 11 "#ffa759"
    print_linux 12 "#73d0ff"
    print_linux 13 "#d4bfff"
    print_linux 14 "#95e6cb"
    print_linux 15 "#cbccc6"
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
