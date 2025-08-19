#!/usr/bin/env bash

# Source:   base16
# Theme:    Stella
# Author:   Shrimpram
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
    print_osc4 0 "2b/21/3c"
    print_osc4 1 "c7/99/87"
    print_osc4 2 "ac/c7/9b"
    print_osc4 3 "c7/c6/91"
    print_osc4 4 "a5/aa/d4"
    print_osc4 5 "c5/94/ff"
    print_osc4 6 "9b/c7/bf"
    print_osc4 7 "99/8b/ad"
    print_osc4 8 "65/59/78"
    print_osc4 9 "c7/99/87"
    print_osc4 10 "ac/c7/9b"
    print_osc4 11 "c7/c6/91"
    print_osc4 12 "a5/aa/d4"
    print_osc4 13 "c5/94/ff"
    print_osc4 14 "9b/c7/bf"
    print_osc4 15 "eb/dc/ff"

    print_osc_rgb 10 "99/8b/ad"
    print_osc_rgb 11 "2b/21/3c"
    print_osc_rgb 12 "99/8b/ad"
    print_osc_rgb 17 "b4/a5/c8"
    print_osc_rgb 19 "36/2b/48"
}

do_linux() {
    print_linux 0 "#2b213c"
    print_linux 1 "#c79987"
    print_linux 2 "#acc79b"
    print_linux 3 "#c7c691"
    print_linux 4 "#a5aad4"
    print_linux 5 "#c594ff"
    print_linux 6 "#9bc7bf"
    print_linux 7 "#998bad"
    print_linux 8 "#655978"
    print_linux 9 "#c79987"
    print_linux 10 "#acc79b"
    print_linux 11 "#c7c691"
    print_linux 12 "#a5aad4"
    print_linux 13 "#c594ff"
    print_linux 14 "#9bc7bf"
    print_linux 15 "#ebdcff"
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
