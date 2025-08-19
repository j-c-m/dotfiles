#!/usr/bin/env bash

# Source:   gogh
# Theme:    Vag
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
    print_osc4 0 "30/30/30"
    print_osc4 1 "a8/71/39"
    print_osc4 2 "39/a8/71"
    print_osc4 3 "71/a8/39"
    print_osc4 4 "71/39/a8"
    print_osc4 5 "a8/39/71"
    print_osc4 6 "39/71/a8"
    print_osc4 7 "8a/8a/8a"
    print_osc4 8 "49/49/49"
    print_osc4 9 "b0/76/3b"
    print_osc4 10 "3b/b0/76"
    print_osc4 11 "76/b0/3b"
    print_osc4 12 "76/3b/b0"
    print_osc4 13 "b0/3b/76"
    print_osc4 14 "3b/76/b0"
    print_osc4 15 "cf/cf/cf"

    print_osc_rgb 10 "d9/e6/f2"
    print_osc_rgb 11 "19/1f/1d"
    print_osc_rgb 12 "d9/e6/f2"
    print_osc_rgb 17 "d9/e6/f2"
    print_osc_rgb 19 "19/1f/1d"
}

do_linux() {
    print_linux 0 "#303030"
    print_linux 1 "#a87139"
    print_linux 2 "#39a871"
    print_linux 3 "#71a839"
    print_linux 4 "#7139a8"
    print_linux 5 "#a83971"
    print_linux 6 "#3971a8"
    print_linux 7 "#d9e6f2"
    print_linux 8 "#494949"
    print_linux 9 "#b0763b"
    print_linux 10 "#3bb076"
    print_linux 11 "#76b03b"
    print_linux 12 "#763bb0"
    print_linux 13 "#b03b76"
    print_linux 14 "#3b76b0"
    print_linux 15 "#cfcfcf"
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
