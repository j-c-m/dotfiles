#!/usr/bin/env bash

# Source:   gogh
# Theme:    Synthwave Alpha
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
    print_osc4 0 "24/1b/30"
    print_osc4 1 "9a/00/48"
    print_osc4 2 "00/98/6c"
    print_osc4 3 "ad/ad/3e"
    print_osc4 4 "6e/29/ad"
    print_osc4 5 "b3/00/ad"
    print_osc4 6 "00/b0/b1"
    print_osc4 7 "b9/b1/bc"
    print_osc4 8 "7f/70/94"
    print_osc4 9 "e6/0a/70"
    print_osc4 10 "0a/e4/a4"
    print_osc4 11 "f9/f9/72"
    print_osc4 12 "aa/54/f9"
    print_osc4 13 "ff/00/f6"
    print_osc4 14 "00/fb/fd"
    print_osc4 15 "f2/f2/e3"

    print_osc_rgb 10 "f2/f2/e3"
    print_osc_rgb 11 "24/1b/30"
    print_osc_rgb 12 "f2/f2/e3"
    print_osc_rgb 17 "f2/f2/e3"
    print_osc_rgb 19 "24/1b/30"
}

do_linux() {
    print_linux 0 "#241b30"
    print_linux 1 "#9a0048"
    print_linux 2 "#00986c"
    print_linux 3 "#adad3e"
    print_linux 4 "#6e29ad"
    print_linux 5 "#b300ad"
    print_linux 6 "#00b0b1"
    print_linux 7 "#f2f2e3"
    print_linux 8 "#7f7094"
    print_linux 9 "#e60a70"
    print_linux 10 "#0ae4a4"
    print_linux 11 "#f9f972"
    print_linux 12 "#aa54f9"
    print_linux 13 "#ff00f6"
    print_linux 14 "#00fbfd"
    print_linux 15 "#f2f2e3"
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
