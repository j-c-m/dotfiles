#!/usr/bin/env bash

# Source:   base24
# Theme:    Bluloco Light
# Author:   FredHappyface (https://github.com/fredHappyface)
# Variant:  light

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
    print_osc4 0 "f7/f7/f7"
    print_osc4 1 "c8/0d/41"
    print_osc4 2 "20/88/39"
    print_osc4 3 "10/85/d9"
    print_osc4 4 "1d/44/dd"
    print_osc4 5 "6d/1b/ed"
    print_osc4 6 "1e/4d/7a"
    print_osc4 7 "38/38/3a"
    print_osc4 8 "a6/a7/ae"
    print_osc4 9 "fb/49/6d"
    print_osc4 10 "34/b2/53"
    print_osc4 11 "b7/93/26"
    print_osc4 12 "10/85/d9"
    print_osc4 13 "c0/0c/b2"
    print_osc4 14 "5a/7f/ac"
    print_osc4 15 "1c/1d/21"

    print_osc_rgb 10 "38/38/3a"
    print_osc_rgb 11 "f7/f7/f7"
    print_osc_rgb 12 "38/38/3a"
    print_osc_rgb 17 "00/00/00"
    print_osc_rgb 19 "cb/cc/d4"
}

do_linux() {
    print_linux 0 "#f7f7f7"
    print_linux 1 "#c80d41"
    print_linux 2 "#208839"
    print_linux 3 "#1085d9"
    print_linux 4 "#1d44dd"
    print_linux 5 "#6d1bed"
    print_linux 6 "#1e4d7a"
    print_linux 7 "#38383a"
    print_linux 8 "#a6a7ae"
    print_linux 9 "#fb496d"
    print_linux 10 "#34b253"
    print_linux 11 "#b79326"
    print_linux 12 "#1085d9"
    print_linux 13 "#c00cb2"
    print_linux 14 "#5a7fac"
    print_linux 15 "#1c1d21"
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
