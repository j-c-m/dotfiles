#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Pro Ristretto
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
    print_osc4 0 "3e/38/38"
    print_osc4 1 "df/74/84"
    print_osc4 2 "bb/d8/7e"
    print_osc4 3 "ed/ce/73"
    print_osc4 4 "dc/93/73"
    print_osc4 5 "a9/aa/e9"
    print_osc4 6 "a4/d7/cc"
    print_osc4 7 "fb/f2/f3"
    print_osc4 8 "70/69/6a"
    print_osc4 9 "df/74/84"
    print_osc4 10 "bb/d8/7e"
    print_osc4 11 "ed/ce/73"
    print_osc4 12 "dc/93/73"
    print_osc4 13 "a9/aa/e9"
    print_osc4 14 "a4/d7/cc"
    print_osc4 15 "fb/f2/f3"

    print_osc_rgb 10 "fb/f2/f3"
    print_osc_rgb 11 "3e/38/38"
    print_osc_rgb 12 "fb/f2/f3"
    print_osc_rgb 17 "fb/f2/f3"
    print_osc_rgb 19 "3e/38/38"
}

do_linux() {
    print_linux 0 "#3e3838"
    print_linux 1 "#df7484"
    print_linux 2 "#bbd87e"
    print_linux 3 "#edce73"
    print_linux 4 "#dc9373"
    print_linux 5 "#a9aae9"
    print_linux 6 "#a4d7cc"
    print_linux 7 "#fbf2f3"
    print_linux 8 "#70696a"
    print_linux 9 "#df7484"
    print_linux 10 "#bbd87e"
    print_linux 11 "#edce73"
    print_linux 12 "#dc9373"
    print_linux 13 "#a9aae9"
    print_linux 14 "#a4d7cc"
    print_linux 15 "#fbf2f3"
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
