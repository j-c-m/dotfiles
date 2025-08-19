#!/usr/bin/env bash

# Source:   base24
# Theme:    Sundried
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
    print_osc4 0 "1a/18/18"
    print_osc4 1 "a6/46/3d"
    print_osc4 2 "57/76/44"
    print_osc4 3 "78/98/f7"
    print_osc4 4 "48/5a/98"
    print_osc4 5 "85/45/51"
    print_osc4 6 "9c/81/4e"
    print_osc4 7 "a9/a9/a7"
    print_osc4 8 "6b/6b/67"
    print_osc4 9 "aa/00/0c"
    print_osc4 10 "12/8c/20"
    print_osc4 11 "fc/6a/20"
    print_osc4 12 "78/98/f7"
    print_osc4 13 "fc/89/a0"
    print_osc4 14 "fa/d3/84"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "a9/a9/a7"
    print_osc_rgb 11 "1a/18/18"
    print_osc_rgb 12 "a9/a9/a7"
    print_osc_rgb 17 "c8/c8/c8"
    print_osc_rgb 19 "30/2b/2a"
}

do_linux() {
    print_linux 0 "#1a1818"
    print_linux 1 "#a6463d"
    print_linux 2 "#577644"
    print_linux 3 "#7898f7"
    print_linux 4 "#485a98"
    print_linux 5 "#854551"
    print_linux 6 "#9c814e"
    print_linux 7 "#a9a9a7"
    print_linux 8 "#6b6b67"
    print_linux 9 "#aa000c"
    print_linux 10 "#128c20"
    print_linux 11 "#fc6a20"
    print_linux 12 "#7898f7"
    print_linux 13 "#fc89a0"
    print_linux 14 "#fad384"
    print_linux 15 "#fffefe"
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
