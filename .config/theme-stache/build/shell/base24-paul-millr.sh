#!/usr/bin/env bash

# Source:   base24
# Theme:    Paul Millr
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 1 "ff/00/00"
    print_osc4 2 "79/ff/0f"
    print_osc4 3 "70/9a/ed"
    print_osc4 4 "38/6b/d7"
    print_osc4 5 "b3/49/be"
    print_osc4 6 "66/cc/ff"
    print_osc4 7 "a5/a5/a5"
    print_osc4 8 "7b/7b/7b"
    print_osc4 9 "ff/00/80"
    print_osc4 10 "66/ff/66"
    print_osc4 11 "f3/d6/4e"
    print_osc4 12 "70/9a/ed"
    print_osc4 13 "db/67/e6"
    print_osc4 14 "79/df/f2"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a5/a5/a5"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "a5/a5/a5"
    print_osc_rgb 17 "bb/bb/bb"
    print_osc_rgb 19 "2a/2a/2a"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff0000"
    print_linux 2 "#79ff0f"
    print_linux 3 "#709aed"
    print_linux 4 "#386bd7"
    print_linux 5 "#b349be"
    print_linux 6 "#66ccff"
    print_linux 7 "#a5a5a5"
    print_linux 8 "#7b7b7b"
    print_linux 9 "#ff0080"
    print_linux 10 "#66ff66"
    print_linux 11 "#f3d64e"
    print_linux 12 "#709aed"
    print_linux 13 "#db67e6"
    print_linux 14 "#79dff2"
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
