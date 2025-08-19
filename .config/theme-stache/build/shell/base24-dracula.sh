#!/usr/bin/env bash

# Source:   base24
# Theme:    Dracula
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
    print_osc4 0 "28/2a/36"
    print_osc4 1 "ff/55/55"
    print_osc4 2 "50/fa/7b"
    print_osc4 3 "f1/fa/8c"
    print_osc4 4 "80/bf/ff"
    print_osc4 5 "ff/79/c6"
    print_osc4 6 "8b/e9/fd"
    print_osc4 7 "f8/f8/f2"
    print_osc4 8 "62/72/a4"
    print_osc4 9 "f2/8c/8c"
    print_osc4 10 "a3/f5/b8"
    print_osc4 11 "ee/f5/a3"
    print_osc4 12 "a3/cc/f5"
    print_osc4 13 "f5/a3/d2"
    print_osc4 14 "ba/ed/f7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "f8/f8/f2"
    print_osc_rgb 11 "28/2a/36"
    print_osc_rgb 12 "f8/f8/f2"
    print_osc_rgb 17 "f0/f1/f4"
    print_osc_rgb 19 "36/34/47"
}

do_linux() {
    print_linux 0 "#282a36"
    print_linux 1 "#ff5555"
    print_linux 2 "#50fa7b"
    print_linux 3 "#f1fa8c"
    print_linux 4 "#80bfff"
    print_linux 5 "#ff79c6"
    print_linux 6 "#8be9fd"
    print_linux 7 "#f8f8f2"
    print_linux 8 "#6272a4"
    print_linux 9 "#f28c8c"
    print_linux 10 "#a3f5b8"
    print_linux 11 "#eef5a3"
    print_linux 12 "#a3ccf5"
    print_linux 13 "#f5a3d2"
    print_linux 14 "#baedf7"
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
