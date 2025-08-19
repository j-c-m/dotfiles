#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Pro
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
    print_osc4 0 "2c/2a/2e"
    print_osc4 1 "ff/61/87"
    print_osc4 2 "a8/db/75"
    print_osc4 3 "ff/d7/66"
    print_osc4 4 "fb/98/66"
    print_osc4 5 "ab/9c/f1"
    print_osc4 6 "78/db/e8"
    print_osc4 7 "fb/fb/fa"
    print_osc4 8 "71/70/71"
    print_osc4 9 "ff/61/87"
    print_osc4 10 "a8/db/75"
    print_osc4 11 "ff/d7/66"
    print_osc4 12 "fb/98/66"
    print_osc4 13 "ab/9c/f1"
    print_osc4 14 "78/db/e8"
    print_osc4 15 "fb/fb/fa"

    print_osc_rgb 10 "fb/fb/fa"
    print_osc_rgb 11 "2c/2a/2e"
    print_osc_rgb 12 "c1/c0/c0"
    print_osc_rgb 17 "5b/58/5b"
    print_osc_rgb 19 "fb/fb/fa"
}

do_linux() {
    print_linux 0 "#2c2a2e"
    print_linux 1 "#ff6187"
    print_linux 2 "#a8db75"
    print_linux 3 "#ffd766"
    print_linux 4 "#fb9866"
    print_linux 5 "#ab9cf1"
    print_linux 6 "#78dbe8"
    print_linux 7 "#fbfbfa"
    print_linux 8 "#717071"
    print_linux 9 "#ff6187"
    print_linux 10 "#a8db75"
    print_linux 11 "#ffd766"
    print_linux 12 "#fb9866"
    print_linux 13 "#ab9cf1"
    print_linux 14 "#78dbe8"
    print_linux 15 "#fbfbfa"
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
