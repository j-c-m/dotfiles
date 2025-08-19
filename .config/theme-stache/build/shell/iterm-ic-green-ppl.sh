#!/usr/bin/env bash

# Source:   iterm
# Theme:    IC_Green_PPL
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
    print_osc4 0 "01/44/01"
    print_osc4 1 "fe/26/35"
    print_osc4 2 "41/a6/38"
    print_osc4 3 "76/a8/30"
    print_osc4 4 "2e/c3/b9"
    print_osc4 5 "50/a0/96"
    print_osc4 6 "3c/a0/78"
    print_osc4 7 "e6/fe/f2"
    print_osc4 8 "02/5c/02"
    print_osc4 9 "b4/fa/5c"
    print_osc4 10 "ae/fa/86"
    print_osc4 11 "da/fa/87"
    print_osc4 12 "2e/fa/eb"
    print_osc4 13 "50/fa/fa"
    print_osc4 14 "3c/fa/c8"
    print_osc4 15 "e0/f1/dc"

    print_osc_rgb 10 "e0/f1/dc"
    print_osc_rgb 11 "2c/2c/2c"
    print_osc_rgb 12 "46/f9/6b"
    print_osc_rgb 17 "11/6b/41"
    print_osc_rgb 19 "e0/f1/dc"
}

do_linux() {
    print_linux 0 "#014401"
    print_linux 1 "#fe2635"
    print_linux 2 "#41a638"
    print_linux 3 "#76a830"
    print_linux 4 "#2ec3b9"
    print_linux 5 "#50a096"
    print_linux 6 "#3ca078"
    print_linux 7 "#e0f1dc"
    print_linux 8 "#025c02"
    print_linux 9 "#b4fa5c"
    print_linux 10 "#aefa86"
    print_linux 11 "#dafa87"
    print_linux 12 "#2efaeb"
    print_linux 13 "#50fafa"
    print_linux 14 "#3cfac8"
    print_linux 15 "#e0f1dc"
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
