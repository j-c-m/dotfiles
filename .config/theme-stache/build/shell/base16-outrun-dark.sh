#!/usr/bin/env bash

# Source:   base16
# Theme:    Outrun Dark
# Author:   Hugo Delahousse (http://github.com/hugodelahousse/)
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
    print_osc4 0 "00/00/2a"
    print_osc4 1 "ff/42/42"
    print_osc4 2 "59/f1/76"
    print_osc4 3 "f3/e8/77"
    print_osc4 4 "66/b0/ff"
    print_osc4 5 "f1/05/96"
    print_osc4 6 "0e/f0/f0"
    print_osc4 7 "d0/d0/fa"
    print_osc4 8 "50/50/7a"
    print_osc4 9 "ff/42/42"
    print_osc4 10 "59/f1/76"
    print_osc4 11 "f3/e8/77"
    print_osc4 12 "66/b0/ff"
    print_osc4 13 "f1/05/96"
    print_osc4 14 "0e/f0/f0"
    print_osc4 15 "f5/f5/ff"

    print_osc_rgb 10 "d0/d0/fa"
    print_osc_rgb 11 "00/00/2a"
    print_osc_rgb 12 "d0/d0/fa"
    print_osc_rgb 17 "e0/e0/ff"
    print_osc_rgb 19 "20/20/4a"
}

do_linux() {
    print_linux 0 "#00002a"
    print_linux 1 "#ff4242"
    print_linux 2 "#59f176"
    print_linux 3 "#f3e877"
    print_linux 4 "#66b0ff"
    print_linux 5 "#f10596"
    print_linux 6 "#0ef0f0"
    print_linux 7 "#d0d0fa"
    print_linux 8 "#50507a"
    print_linux 9 "#ff4242"
    print_linux 10 "#59f176"
    print_linux 11 "#f3e877"
    print_linux 12 "#66b0ff"
    print_linux 13 "#f10596"
    print_linux 14 "#0ef0f0"
    print_linux 15 "#f5f5ff"
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
