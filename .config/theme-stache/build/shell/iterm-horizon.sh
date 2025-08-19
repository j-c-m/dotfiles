#!/usr/bin/env bash

# Source:   iterm
# Theme:    Horizon
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
    print_osc4 1 "e9/56/78"
    print_osc4 2 "29/d3/98"
    print_osc4 3 "fa/b7/95"
    print_osc4 4 "26/bb/d9"
    print_osc4 5 "ee/64/ac"
    print_osc4 6 "59/e1/e3"
    print_osc4 7 "e5/e5/e5"
    print_osc4 8 "66/66/66"
    print_osc4 9 "ec/6a/88"
    print_osc4 10 "3f/da/a4"
    print_osc4 11 "fb/c3/a7"
    print_osc4 12 "3f/c4/de"
    print_osc4 13 "f0/75/b5"
    print_osc4 14 "6b/e4/e6"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "d5/d8/da"
    print_osc_rgb 11 "1c/1e/26"
    print_osc_rgb 12 "6c/6f/93"
    print_osc_rgb 17 "6c/6f/93"
    print_osc_rgb 19 "1c/1e/26"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e95678"
    print_linux 2 "#29d398"
    print_linux 3 "#fab795"
    print_linux 4 "#26bbd9"
    print_linux 5 "#ee64ac"
    print_linux 6 "#59e1e3"
    print_linux 7 "#d5d8da"
    print_linux 8 "#666666"
    print_linux 9 "#ec6a88"
    print_linux 10 "#3fdaa4"
    print_linux 11 "#fbc3a7"
    print_linux 12 "#3fc4de"
    print_linux 13 "#f075b5"
    print_linux 14 "#6be4e6"
    print_linux 15 "#e5e5e5"
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
