#!/usr/bin/env bash

# Source:   base16
# Theme:    Darcula
# Author:   jetbrains
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
    print_osc4 0 "2b/2b/2b"
    print_osc4 1 "4e/ad/e5"
    print_osc4 2 "6a/87/59"
    print_osc4 3 "bb/b5/29"
    print_osc4 4 "98/76/aa"
    print_osc4 5 "cc/78/32"
    print_osc4 6 "62/97/55"
    print_osc4 7 "a9/b7/c6"
    print_osc4 8 "60/63/66"
    print_osc4 9 "4e/ad/e5"
    print_osc4 10 "6a/87/59"
    print_osc4 11 "bb/b5/29"
    print_osc4 12 "98/76/aa"
    print_osc4 13 "cc/78/32"
    print_osc4 14 "62/97/55"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a9/b7/c6"
    print_osc_rgb 11 "2b/2b/2b"
    print_osc_rgb 12 "a9/b7/c6"
    print_osc_rgb 17 "ff/c6/6d"
    print_osc_rgb 19 "32/32/32"
}

do_linux() {
    print_linux 0 "#2b2b2b"
    print_linux 1 "#4eade5"
    print_linux 2 "#6a8759"
    print_linux 3 "#bbb529"
    print_linux 4 "#9876aa"
    print_linux 5 "#cc7832"
    print_linux 6 "#629755"
    print_linux 7 "#a9b7c6"
    print_linux 8 "#606366"
    print_linux 9 "#4eade5"
    print_linux 10 "#6a8759"
    print_linux 11 "#bbb529"
    print_linux 12 "#9876aa"
    print_linux 13 "#cc7832"
    print_linux 14 "#629755"
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
