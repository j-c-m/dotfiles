#!/usr/bin/env bash

# Source:   iterm
# Theme:    catppuccin-macchiato
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
    print_osc4 0 "49/4d/64"
    print_osc4 1 "ed/87/96"
    print_osc4 2 "a6/da/95"
    print_osc4 3 "ee/d4/9f"
    print_osc4 4 "8a/ad/f4"
    print_osc4 5 "f5/bd/e6"
    print_osc4 6 "8b/d5/ca"
    print_osc4 7 "a5/ad/cb"
    print_osc4 8 "5b/60/78"
    print_osc4 9 "ec/74/86"
    print_osc4 10 "8c/cf/7f"
    print_osc4 11 "e1/c6/82"
    print_osc4 12 "78/a1/f6"
    print_osc4 13 "f2/a9/dd"
    print_osc4 14 "63/cb/c0"
    print_osc4 15 "b8/c0/e0"

    print_osc_rgb 10 "ca/d3/f5"
    print_osc_rgb 11 "24/27/3a"
    print_osc_rgb 12 "f4/db/d6"
    print_osc_rgb 17 "5b/60/78"
    print_osc_rgb 19 "ca/d3/f5"
}

do_linux() {
    print_linux 0 "#494d64"
    print_linux 1 "#ed8796"
    print_linux 2 "#a6da95"
    print_linux 3 "#eed49f"
    print_linux 4 "#8aadf4"
    print_linux 5 "#f5bde6"
    print_linux 6 "#8bd5ca"
    print_linux 7 "#cad3f5"
    print_linux 8 "#5b6078"
    print_linux 9 "#ec7486"
    print_linux 10 "#8ccf7f"
    print_linux 11 "#e1c682"
    print_linux 12 "#78a1f6"
    print_linux 13 "#f2a9dd"
    print_linux 14 "#63cbc0"
    print_linux 15 "#b8c0e0"
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
