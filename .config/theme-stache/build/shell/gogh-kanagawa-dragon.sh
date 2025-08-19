#!/usr/bin/env bash

# Source:   gogh
# Theme:    Kanagawa Dragon
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "0d/0c/0c"
    print_osc4 1 "c4/74/6e"
    print_osc4 2 "8a/9a/7b"
    print_osc4 3 "c4/b2/8a"
    print_osc4 4 "8b/a4/b0"
    print_osc4 5 "a2/92/a3"
    print_osc4 6 "8e/a4/a2"
    print_osc4 7 "c8/c0/93"
    print_osc4 8 "a6/a6/9c"
    print_osc4 9 "e4/68/76"
    print_osc4 10 "87/a9/87"
    print_osc4 11 "e6/c3/84"
    print_osc4 12 "7f/b4/ca"
    print_osc4 13 "93/8a/a9"
    print_osc4 14 "7a/a8/9f"
    print_osc4 15 "c5/c9/c5"

    print_osc_rgb 10 "c5/c9/c5"
    print_osc_rgb 11 "18/16/16"
    print_osc_rgb 12 "c8/c0/93"
    print_osc_rgb 17 "c5/c9/c5"
    print_osc_rgb 19 "18/16/16"
}

do_linux() {
    print_linux 0 "#0d0c0c"
    print_linux 1 "#c4746e"
    print_linux 2 "#8a9a7b"
    print_linux 3 "#c4b28a"
    print_linux 4 "#8ba4b0"
    print_linux 5 "#a292a3"
    print_linux 6 "#8ea4a2"
    print_linux 7 "#c5c9c5"
    print_linux 8 "#a6a69c"
    print_linux 9 "#e46876"
    print_linux 10 "#87a987"
    print_linux 11 "#e6c384"
    print_linux 12 "#7fb4ca"
    print_linux 13 "#938aa9"
    print_linux 14 "#7aa89f"
    print_linux 15 "#c5c9c5"
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
