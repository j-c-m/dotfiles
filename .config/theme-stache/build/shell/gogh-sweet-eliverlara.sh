#!/usr/bin/env bash

# Source:   gogh
# Theme:    Sweet Eliverlara
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
    print_osc4 0 "28/2c/34"
    print_osc4 1 "ed/25/4e"
    print_osc4 2 "71/f7/9f"
    print_osc4 3 "f9/dc/5c"
    print_osc4 4 "7c/b7/ff"
    print_osc4 5 "c7/4d/ed"
    print_osc4 6 "00/c1/e4"
    print_osc4 7 "dc/df/e4"
    print_osc4 8 "28/2c/34"
    print_osc4 9 "ed/25/4e"
    print_osc4 10 "71/f7/9f"
    print_osc4 11 "f9/dc/5c"
    print_osc4 12 "7c/b7/ff"
    print_osc4 13 "c7/4d/ed"
    print_osc4 14 "00/c1/e4"
    print_osc4 15 "dc/df/e4"

    print_osc_rgb 10 "c3/c7/d1"
    print_osc_rgb 11 "28/2c/34"
    print_osc_rgb 12 "c3/c7/d1"
    print_osc_rgb 17 "c3/c7/d1"
    print_osc_rgb 19 "28/2c/34"
}

do_linux() {
    print_linux 0 "#282c34"
    print_linux 1 "#ed254e"
    print_linux 2 "#71f79f"
    print_linux 3 "#f9dc5c"
    print_linux 4 "#7cb7ff"
    print_linux 5 "#c74ded"
    print_linux 6 "#00c1e4"
    print_linux 7 "#c3c7d1"
    print_linux 8 "#282c34"
    print_linux 9 "#ed254e"
    print_linux 10 "#71f79f"
    print_linux 11 "#f9dc5c"
    print_linux 12 "#7cb7ff"
    print_linux 13 "#c74ded"
    print_linux 14 "#00c1e4"
    print_linux 15 "#dcdfe4"
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
