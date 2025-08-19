#!/usr/bin/env bash

# Source:   iterm
# Theme:    Rapture
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
    print_osc4 1 "fc/64/4d"
    print_osc4 2 "7a/fd/e1"
    print_osc4 3 "ff/f0/9b"
    print_osc4 4 "6c/9b/f5"
    print_osc4 5 "ff/4f/a1"
    print_osc4 6 "64/e0/ff"
    print_osc4 7 "c0/c9/e5"
    print_osc4 8 "30/4b/66"
    print_osc4 9 "fc/64/4d"
    print_osc4 10 "7a/fd/e1"
    print_osc4 11 "ff/f0/9b"
    print_osc4 12 "6c/9b/f5"
    print_osc4 13 "ff/4f/a1"
    print_osc4 14 "64/e0/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c0/c9/e5"
    print_osc_rgb 11 "11/1e/2a"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "30/4b/66"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fc644d"
    print_linux 2 "#7afde1"
    print_linux 3 "#fff09b"
    print_linux 4 "#6c9bf5"
    print_linux 5 "#ff4fa1"
    print_linux 6 "#64e0ff"
    print_linux 7 "#c0c9e5"
    print_linux 8 "#304b66"
    print_linux 9 "#fc644d"
    print_linux 10 "#7afde1"
    print_linux 11 "#fff09b"
    print_linux 12 "#6c9bf5"
    print_linux 13 "#ff4fa1"
    print_linux 14 "#64e0ff"
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
