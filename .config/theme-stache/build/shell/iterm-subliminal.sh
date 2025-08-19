#!/usr/bin/env bash

# Source:   iterm
# Theme:    Subliminal
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
    print_osc4 0 "7f/7f/7f"
    print_osc4 1 "e1/5a/60"
    print_osc4 2 "a9/cf/a4"
    print_osc4 3 "ff/e2/a9"
    print_osc4 4 "66/99/cc"
    print_osc4 5 "f1/a5/ab"
    print_osc4 6 "5f/b3/b3"
    print_osc4 7 "d4/d4/d4"
    print_osc4 8 "7f/7f/7f"
    print_osc4 9 "e1/5a/60"
    print_osc4 10 "a9/cf/a4"
    print_osc4 11 "ff/e2/a9"
    print_osc4 12 "66/99/cc"
    print_osc4 13 "f1/a5/ab"
    print_osc4 14 "5f/b3/b3"
    print_osc4 15 "d4/d4/d4"

    print_osc_rgb 10 "d4/d4/d4"
    print_osc_rgb 11 "28/2c/35"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "48/4e/5b"
    print_osc_rgb 19 "fe/ff/ff"
}

do_linux() {
    print_linux 0 "#7f7f7f"
    print_linux 1 "#e15a60"
    print_linux 2 "#a9cfa4"
    print_linux 3 "#ffe2a9"
    print_linux 4 "#6699cc"
    print_linux 5 "#f1a5ab"
    print_linux 6 "#5fb3b3"
    print_linux 7 "#d4d4d4"
    print_linux 8 "#7f7f7f"
    print_linux 9 "#e15a60"
    print_linux 10 "#a9cfa4"
    print_linux 11 "#ffe2a9"
    print_linux 12 "#6699cc"
    print_linux 13 "#f1a5ab"
    print_linux 14 "#5fb3b3"
    print_linux 15 "#d4d4d4"
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
