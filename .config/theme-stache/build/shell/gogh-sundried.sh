#!/usr/bin/env bash

# Source:   gogh
# Theme:    Sundried
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
    print_osc4 0 "30/2b/2a"
    print_osc4 1 "a7/46/3d"
    print_osc4 2 "58/77/44"
    print_osc4 3 "9d/60/2a"
    print_osc4 4 "48/5b/98"
    print_osc4 5 "86/46/51"
    print_osc4 6 "9c/81/4f"
    print_osc4 7 "c9/c9/c9"
    print_osc4 8 "4d/4e/48"
    print_osc4 9 "aa/00/0c"
    print_osc4 10 "12/8c/21"
    print_osc4 11 "fc/6a/21"
    print_osc4 12 "79/99/f7"
    print_osc4 13 "fd/8a/a1"
    print_osc4 14 "fa/d4/84"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c9/c9/c9"
    print_osc_rgb 11 "1a/18/18"
    print_osc_rgb 12 "c9/c9/c9"
    print_osc_rgb 17 "c9/c9/c9"
    print_osc_rgb 19 "1a/18/18"
}

do_linux() {
    print_linux 0 "#302b2a"
    print_linux 1 "#a7463d"
    print_linux 2 "#587744"
    print_linux 3 "#9d602a"
    print_linux 4 "#485b98"
    print_linux 5 "#864651"
    print_linux 6 "#9c814f"
    print_linux 7 "#c9c9c9"
    print_linux 8 "#4d4e48"
    print_linux 9 "#aa000c"
    print_linux 10 "#128c21"
    print_linux 11 "#fc6a21"
    print_linux 12 "#7999f7"
    print_linux 13 "#fd8aa1"
    print_linux 14 "#fad484"
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
